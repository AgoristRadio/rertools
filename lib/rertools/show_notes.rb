module Rertools

  class ShowNotes
    def initialize(episode_number, show_notes_source)
      @episode_number = episode_number
      @raw_show_notes, @body = show_notes_source.get(@episode_number)
      #@show_notes_body = show_notes_source.get_full(@episode_number)
      parse
    end

    def parse
      @parsed_data = Psych.load(@raw_show_notes)
    end

    def body
      @body
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