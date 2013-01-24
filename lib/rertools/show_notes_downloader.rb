module Rertools

  class ShowNotesDownloader
    def initialize
      @url = "https://raw.github.com/AgoristRadio/RealityExploitRoundtable/master/"
    end

    def download(episode_number)
      response = HTTParty.get(@url + "EP0#{episode_number}.md")
      raw_show_notes = response.body.scan(/(?<=```).+?(?=```)/m).first
    end

    def download_full(episode_number)
      response = HTTParty.get(@url + "EP0#{episode_number}.md")
      raw_show_notes = response.body#.scan(/(?<=```).+?(?=```)/m).first
    end
  end

end