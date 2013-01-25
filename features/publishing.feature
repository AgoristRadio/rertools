@publishing
Feature: Full Stack Publishing of a a Podcast
  In order to automate the publishing of a podcast episode
  As a podcast publisher
  I want to be able to full stack publish a podcast episode automatically

  Scenario: Publishing an edited mp3 file to the world

    Given an episode filename of "realityexploitroundtable-EP010.mp3"
    When the episode is fully published to the world
    Then the file should be accessible from the public URL
    And the episode post should be seen on the website




















