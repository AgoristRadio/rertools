#@announce
#@rertools
Feature: rer ping
  Scenario: Getting help for shownotes
    When I run `rer help shownotes_metadata`
    Then the output should contain "Display shownotes metadata"

  #@rertools
  Scenario: Getting shownotes metadata for a specific episode
    When I run `rer shownotes_metadata 10`
    Then the output should contain "Reality"

  #@rertools
  Scenario: Getting help for injecting shownotes metadata into mp3
    When I run `rer help inject_metadata`
    Then the output should contain "Inject"

  #@rertools
  Scenario: Injecting shownotes metadata into mp3
    When I run `rer inject_metadata 10 realityexploitroundtable-EP010.mp3`
    Then the output should contain "New Title"

  #@rertools
  Scenario: Getting help for full show publication
    When I run `rer help publish`
    Then the output should contain "podcast on the website"

  @rertools
  Scenario: Balls out full publish from naked mp3 file and existing show notes
    When I run `rer publish 10 realityexploitroundtable-EP010.mp3`
    Then the output should contain "wtf"




#  Scenario: Check rertools is ticking with ping
#    When I run `rer ping`
#    Then the output should contain "pong"

#  Scenario: Check rertools ping help info
#    When I run `rer help ping`
#    Then the output should contain "alive"