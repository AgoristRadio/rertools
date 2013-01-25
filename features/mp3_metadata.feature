@rerlibs
@metadata
Feature: Updating MP3 ID3 Tag Metadata
  In order to automate the publishing of a podcast episode
  As a podcast publisher
  I want to be able to update an mp3's id tags to episode metadata

  Scenario: Updating MP3 file with static show notes metadata
    Given an episode filename of "realityexploitroundtable-EP010.mp3"
    When the show notes are retrieved from source "raw" with body
    """
    ---
    Show: Reality Exploit Roundtable
    Episode: 10
    Topics: MEK gets on Terrorist Buddy List, We saw what you Read,
            CleanIT for a Proper Internet, Drone Death Squads in Mexico
    Moderator: Voodoo
    Panelists: Voodoo, Hiro, Smuggler, Wise-Guy, Plato
    Date: Sept 24, 2012
    Tags: big brother, drones, censorship
    ---

    blah blah haha
    wtf

    testing 123 all these other show notes....

    """
    And the mp3 file is updated with the show notes metadata
    Then the mp3 file's id3 tag for "title" should contain "CleanIT for a Proper Internet"
    Then the mp3 file's id3 tag for "artist" should be "Voodoo, Hiro, Smuggler, Wise-Guy, Plato"
    Then the mp3 file's id3 tag for "genre" should be "Talk"
    Then the mp3 file's id3 tag for "tracknum" should be "010"
    Then the mp3 file's id3 tag for "album" should be "Reality Exploit Roundtable"
    Then the mp3 file's id3 tag for "year" should be "2012"
    Then the mp3 file's id3 tag for "comments" should be "Excellent!"

  Scenario: Updating MP3 file with github show notes metadata
    Given an episode filename of "realityexploitroundtable-EP010.mp3"
    When the show notes are retrieved from source "github" with body
    """
    ---
    Show: Reality Exploit Roundtable
    Episode: 10
    Topics: MEK gets on Terrorist Buddy List, We saw what you Read,
            CleanIT for a Proper Internet, Drone Death Squads in Mexico
    Moderator: Voodoo
    Panelists: Voodoo, Hiro, Smuggler, Wise-Guy, Plato
    Date: Sept 24, 2012
    Tags: big brother, drones, censorship
    ---

    blah blah haha
    wtf

    testing 123 all these other show notes....

    """
    And the mp3 file is updated with the show notes metadata
    Then the mp3 file's id3 tag for "title" should contain "CleanIT for a Proper Internet"
    Then the mp3 file's id3 tag for "artist" should be "Voodoo, Hiro, Smuggler, Wise-Guy, Plato"
    Then the mp3 file's id3 tag for "genre" should be "Talk"
    Then the mp3 file's id3 tag for "tracknum" should be "010"
    Then the mp3 file's id3 tag for "album" should be "Reality Exploit Roundtable"
    Then the mp3 file's id3 tag for "year" should be "2012"
    Then the mp3 file's id3 tag for "comments" should be "Excellent!"
