module Rertools

  class EpisodePoster

    attr_reader(:config)

    def initialize(config, mp3_filename, show_notes)
      @config = config
      @mp3_filename = mp3_filename
      @show_notes = show_notes
      @mechanize = Mechanize.new
    end

    def post
      send_post
      update_post
      true # TODO: better error handling, for now, no exceptions happened, so I guess success. yuck.
    end

    def update_post
      mechanize_login
      mechanize_episode_update
    end

    def uploaded_post_exists?
      @mechanize.get(@config.episode_frontpage_url) do |frontpage|
        needle = @show_notes.topics.join(", ")
        return !!(frontpage.body.match(needle))
      end
    end

    def episode_url
      @config.post_preview_base_url + @post_id
    end

    private

    def mechanize_login
      @mechanize.get(@config.episode_edit_login_url) do |login_page|
        login_page.form_with(:name => 'loginform') do |f|
          f.log = @config.remote_username
          f.pwd = @config.remote_password
        end.click_button
      end
    end

    def mechanize_episode_update
      @mechanize.get(episode_edit_form_full_url) do |page|
        page.form_with(:name => 'post') do |form|
          form["Powerpress[podcast][url]"] = powerpress_podcast_url
          form["thumb-large"] = @config.rer_banner_large_url
          form["aa"] = Date.parse(@show_notes.date).year
          form["mm"] = Date.parse(@show_notes.date).month
          form["jj"] = Date.parse(@show_notes.date).day
          form.click_button(form.button_with(:name => "save"))
        end
      end
    end

    def powerpress_podcast_url
      "#{@config.public_mp3_folder_url}/#{base_mp3_filename}"
    end

    def episode_edit_form_full_url
      @config.episode_edit_form_base_url + @post_id
    end

    def base_mp3_filename
      @mp3_filename.split("/").last
    end

    def send_post
      mp3 = Rertools::Mp3.new(@mp3_filename)

      @post = {:title => mp3.title, :description => get_and_render_show_notes,
               :mt_keywords => show_notes_tags,
               :categories => @config.default_show_categories}
      send_post_low_level
    end

    def send_post_low_level
      connection = XMLRPC::Client.new(@config.remote_url_host, @config.remote_url_path)
      @post_id = connection.call(
          'metaWeblog.newPost', 1,
          @config.remote_username, @config.remote_password, @post, @config.post_as_public)
    end

    def get_and_render_show_notes
      md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      md.render(@show_notes.body)
    end

    def show_notes_tags
      @show_notes.tags.join(", ")
    end

    def episode_number_from_filename
      @mp3_filename.split("/").last.match(/\d\d\d/)[0].to_i
    end

  end
end