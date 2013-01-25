module Rertools

  class Mp3

    attr_reader(:mp3_filename)

    def initialize(mp3_filename)
      @mp3_filename = mp3_filename
    end

    def set_metadata(show_notes)
      Mp3Info.open(@mp3_filename) do |mp3|
        mp3.tag2.TIT2 = show_notes.show + " EP" + ("%03d" % show_notes.episode.to_i).to_s + ": " + show_notes.topics.join(", ")
        mp3.tag2.TPE1 = show_notes.panelists.join(", ")
        mp3.tag2.TRCK = ("%03d" % show_notes.episode.to_i).to_s
        mp3.tag2.TCON = "Talk"
        mp3.tag2.TALB = show_notes.show
        mp3.tag2.COMM = "Excellent!"
        mp3.tag2.TYER = Date.parse(show_notes.date).year.to_s
      end
    end

    def title
      Mp3Info.open(@mp3_filename).tag2.TIT2
    end

    def artist
      Mp3Info.open(@mp3_filename).tag2.TPE1
    end

    def comments
      Mp3Info.open(@mp3_filename).tag2.COMM
    end

    def album
      Mp3Info.open(@mp3_filename).tag2.TALB
    end

    def year
      Mp3Info.open(@mp3_filename).tag2.TYER
    end

    def tracknum
      Mp3Info.open(@mp3_filename).tag2.TRCK
    end

    def genre
      Mp3Info.open(@mp3_filename).tag2.TCON
    end

    # Debug

    # TODO: Move this to a decorator/presenter/formatter
    def debug_metadata
      Mp3Info.open(@mp3_filename) do |mp3|
        puts "---------"
        puts mp3
        puts "---------"
        puts "Title: " + mp3.tag.title
        puts "Artist: " + mp3.tag.artist
        puts "Album: " + mp3.tag.album
        puts "Year: " + mp3.tag.year.to_s
        puts "Genre: " + mp3.tag.genre_s
        puts "Comments: " + mp3.tag.comments
        puts "Track #: " + mp3.tag.tracknum.to_s
        puts "---------"
      end
    end
  end
end