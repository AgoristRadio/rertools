module Rertools
  class Mp3Uploader
    def initialize(config, mp3_filename)
      @config = config
      @mp3_filename = mp3_filename
    end

    def upload
      command = "rsync -vae ssh -P #{@mp3_filename} #{@config.ssh_user_host}:#{@config.podcast_public_folder}/"
      `#{command}`
      $?.success?
    end

    def remote_exists?
      remote_filename = @mp3_filename.split("/").last
      command = "ssh #{@config.ssh_user_host} stat #{@config.podcast_public_folder}/#{remote_filename}"
      `#{command}`
      $?.success?
    end

    def url_accessible?
      url = @config.public_base_url
      remote_filename = @mp3_filename.split("/").last
      uri = URI(url.+ "/" + remote_filename)
      test_http_call(uri)
    end

    private

    def test_http_call(uri)
      response_code = Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri.request_uri
        http.request request do |response|
          response_code = response.code.to_i
          break
        end
        response_code == 200 ? true : false
      end
    end

  end
end