module Rertools
  class Cli

    def publish(episode_number, mp3_filename)
      inject_metadata(episode_number, mp3_filename)
      @uploader = Rertools::Mp3Uploader.new(Rertools::Config.new, mp3_filename)
      @uploader.upload

    end

    def inject_metadata(episode_number, mp3_filename)
      puts "Injecting Show Notes Metadata into MP3 File: #{mp3_filename}"

      @mp3 = Rertools::Mp3.new(mp3_filename)
      puts "OLD Title: #{@mp3.title}"
      #ap mp3_filename
      #puts @mp3.exists?
      show_notes = Rertools::ShowNotes.new(episode_number)
      @mp3.set_metadata(show_notes)

      # Verify
      @mp3 = Rertools::Mp3.new(mp3_filename)
      puts "NEW Title: #{@mp3.title}"
      return 1

    end

    def shownotes_metadata(episode_number)
      begin
        puts "Retrieving Show Notes Metadata for Episode # #{episode_number}"
        shownotes = Rertools::ShowNotes.new(episode_number)
        if !shownotes
          puts "Error: Apparently the show notes for episode #{episode_number} do not exist or the yaml is invalid."
          return
        end

        puts "Show Title: #{shownotes.show}"
        puts "Episode #: #{shownotes.episode}"
        puts "Date: #{shownotes.date}"
        puts "Topics: #{shownotes.topics.join(", ")}"
        puts "Moderator: #{shownotes.moderator}"
        puts "Panelists: #{shownotes.panelists.join(", ")}"
        puts "Tags: #{shownotes.tags.join(", ")}"
        puts "Comments: #{shownotes.comments}"
        puts "Genre: #{shownotes.genre}"
      rescue
        false
      end
    end
  end
end
