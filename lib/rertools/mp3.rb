module Rertools

  class Mp3

    #attr_accessor(:title, :artist, :album, :year, :genre, :comments, :tracknum)

    def initialize(mp3_filename)
      @mp3_filename = mp3_filename
    end

    def exists?
      File.exists?(@mp3_filename)
    end

    def set_metadata(show_notes)
      Mp3Info.open(@mp3_filename) do |mp3|
        prefix = "1-"
        mp3.tag2.TIT2 = show_notes.show + " EP" + ("%03d" % show_notes.episode.to_i).to_s + ": " + show_notes.topics.join(", ")
        mp3.tag2.TPE1 = show_notes.panelists.join(", ")
        mp3.tag2.TRCK = ("%03d" % show_notes.episode.to_i).to_s
        mp3.tag2.TCON = "Talk"
        mp3.tag2.TALB =  show_notes.show
        mp3.tag2.COMM =  "Excellent!"
        mp3.tag2.TYER = Date.parse(show_notes.date).year.to_s
      end
    end
=begin
          +{"TIT2"=>"1-WTF MOFO",
      + "TPE1"=>"3Voodoo, Hiro, Smuggler, Wise-Guy, Plato",
      + "TALB"=>"3Reality Exploit Roundtable",
      + "TYER"=>"32012",
      + "TRCK"=>"10",
      + "TCON"=>"3Talk",
      + "COMM"=>"3Excellent!"}
=end

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



    def sfdsfs
      #return @tracknum
      Mp3Info.open(@mp3_filename) do |mp3|
        run = "4"
        mp3.tag2.TIT2 = "12345678901234567890" #run + @title
                                               #mp3.tag.artist = run + @artist
                                               #mp3.tag.album  = run + @album
                                               #mp3.tag.year = run + @year
                                               #mp3.tag.genre_s = run + @genre
                                               #mp3.tag.comments = run + @comments
                                               #mp3.tag.tracknum = @tracknum.to_i
      end
    end

    def blahprint_metadata
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