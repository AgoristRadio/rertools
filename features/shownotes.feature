@shownotes
Feature: Show notes details
  In order to automate the publishing of a podcast episode
  As a podcast publisher
  I want to be able to extract all show detail info from the show notes

  Scenario: Parsing static show notes for detailed info
    Given show notes with body
    """
    ---
    Show: Reality Exploit Roundtable
    Episode: 10
    Date: Sept 24, 2012
    Topics: MEK gets on Terrorist Buddy List, We saw what you Read,
            CleanIT for a Proper Internet, Drone Death Squads in Mexico
    Moderator: Voodoo
    Panelists: Voodoo, Hiro, Smuggler, Wise-Guy, Plato
    Tags: big brother, drones, censorship
    ---

    blah blah haha
    wtf

    testing 123 all these other show notes....

    """
    Then the "moderator" should be "voodoo"
    And the "show" should be "Reality Exploit Roundtable"
    And the "episode" should be "10"
    And the "panelists" should include "Hiro"
    And the "tags" should include "drones"
    And the "date" should be "Sept 24, 2012"
    And the "topics" should include "MEK gets on Terrorist Buddy List"


  Scenario: Parsing downloaded show notes for detailed info
    Given an episode number of "10"
    When the show notes are retrieved from github
    Then the "moderator" should be "voodoo"
    And the "show" should be "Reality Exploit Roundtable"
    And the "episode" should be "10"
    And the "panelists" should include "Hiro"
    And the "date" should be "Sept 24, 2012"
    And the "topics" should include "MEK gets on Terrorist Buddy List"
