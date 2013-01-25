module Rertools
  class Episode
    attr_reader(:episode_number, :mp3)
    attr_accessor(:show_notes)

    def initialize(mp3_filename)
      @episode_number = extract_episode_number(mp3_filename)
      @mp3 = Rertools::Mp3.new(mp3_filename)
      @config = Rertools::Config.new
    end

    def publish
      retrieve_show_notes
      inject_mp3_metadata
      upload_mp3
      upload_post

      if publish_verified?
        @episode_url
      else
        "Unknown error."
      end
    end

    def publish_verified?
      (remote_mp3_url_works? && uploaded_post_exists?)
    end

    def upload_post
      @poster = Rertools::EpisodePoster.new(@config, @mp3.mp3_filename, @show_notes)
      @poster.post
      @episode_url = @poster.episode_url
    end

    def uploaded_post_exists?
      @poster.uploaded_post_exists?
    end

    def upload_mp3
      @uploader = Rertools::Mp3Uploader.new(@config, @mp3.mp3_filename)
      @uploader.upload
    end

    def remote_mp3_exists?
      @uploader.remote_exists?
    end

    def remote_mp3_url_works?
      @uploader.url_accessible?
    end

    def retrieve_show_notes(params = {:source => @config.default_show_notes_source} )
      show_notes_retriever = class_from_source_string(params)
      @show_notes = Rertools::ShowNotes.new(@episode_number, show_notes_retriever)
    end

    def inject_mp3_metadata
      @mp3.set_metadata(@show_notes)
    end

    private

    def class_from_source_string(params)
      # params[:source] should be part of retrieving classname: "github" or "raw"
      class_name = "ShowNotes#{params[:source].capitalize}"
      Rertools.const_get(class_name).new(params)
    end

    def extract_episode_number(mp3_filename)
      mp3_filename.split("/").last.match(/\d\d\d/)[0].to_i
    end
  end
end
