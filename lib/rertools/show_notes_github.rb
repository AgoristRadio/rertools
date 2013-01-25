module Rertools

  class ShowNotesGithub
    def initialize(params)
    end

    def base_url
      # TODO: Move this to config
      "https://raw.github.com/AgoristRadio/RealityExploitRoundtable/master/"
    end

    def get(episode_number)
      response = HTTParty.get(base_url + "EP0#{episode_number}.md")

      [return_yaml_only(response), return_body(response)]
    end

    private

    def return_yaml_only(response)
      response.body.scan(/(?<=```).+?(?=```)/m).first
    end

    def return_body(response)
      strip_yaml_delimiters(response.body)
    end

    def strip_yaml_delimiters(text)
      text.gsub("---\n","")
    end
  end

end