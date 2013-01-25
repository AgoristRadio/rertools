module Rertools
  class Config
    attr_reader(:remote,:remote_password,:remote_username,:remote_url,:remote_url_host,:remote_url_path)

    def initialize
      @remote_url_host = "agoristradio.com"
      @remote_url_path = "/xmlrpc.php"
      @remote_url = "http://#{@remote_url_host}/#{@remote_url_path}"
      @remote_username = 'admin'
      @remote_password = 'c6ee2cs4Uc'
      # TODO remove if truly depreciated
      # @remote = Wordpress.new(@remote_url, @remote_username, @remote_password)
    end


    def default_show_notes_source
      "github"
    end

     def post_as_public
       0
     end

    def ssh_user_host
      "www@agoristradio.com"
    end

    def podcast_public_folder
      "agoristradio.com/library/realityexploitroundtable/test"
    end

    def public_mp3_folder_url
      "http://agoristradio.com/library/realityexploitroundtable/"
    end

    def public_base_url
      "http://agoristradio.com/library/realityexploitroundtable/test"
    end

    def episode_edit_form_base_url
      "http://agoristradio.com/wp-admin/post.php?action=edit&post="
    end

    def episode_frontpage_url
      "http://agoristradio.com/"
    end

    def episode_edit_login_url
      "http://agoristradio.com/wp-login.php"
    end

    def rer_banner_large_url
      "http://library.agoristradio.com/library/realityexploitroundtable/realityexploitroundtable-banner-large.jpg"
    end

    def default_show_categories
      ['Reality Exploit Roundtable']
    end

    def testing_support_path
      "features/support/"
    end

    def post_preview_base_url
       "http://agoristradio.com/?preview=true&p="
    end

  end

end