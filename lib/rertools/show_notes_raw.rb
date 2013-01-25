module Rertools
  class ShowNotesRaw
    def initialize(params)
      @raw_show_notes = params[:raw_show_notes]
    end

    def get(episode_number)
      @raw_show_notes
    end

    def get_full(episode_number)
      raise "download full for show notes raw not implemented"
    end
  end
end