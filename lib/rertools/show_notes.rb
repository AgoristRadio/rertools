module Rertools

  class ShowNotes
    def initialize(episode_number, raw_show_notes=nil)
      @episode_number = episode_number

      if !raw_show_notes
         @raw_show_notes = Rertools::ShowNotesDownloader.new.download(@episode_number)
      else
        @raw_show_notes = raw_show_notes
      end

      parse
    end

    def parse
      @parsed_data = Psych.load(@raw_show_notes)
    end

    def moderator
      @parsed_data["Moderator"].downcase
    end

    def show
      @parsed_data["Show"]
    end

    def episode
      @parsed_data["Episode"].to_s
    end

    def tags
      @parsed_data["Tags"] ? @parsed_data["Tags"].split(", ") : []
    end

    def panelists
      @parsed_data["Panelists"].split(", ")
    end

    def topics
      @parsed_data["Topics"].split(", ") || []
    end

    def date
      @parsed_data["Date"]
    end

    def comments
      @parsed_data["Comments"] || "Excellent!"
    end

    def genre
      @parsed_data["Genre"] || "Talk"
    end

  end
end