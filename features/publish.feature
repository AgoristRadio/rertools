
Feature: Publishing the podcast
  In order to automate the publishing of a podcast episode
  As a podcast publisher
  I want to be able to automatically publish the podcast to the public

  @publishing-mp3
  Scenario: Uploading a prepared mp3 file to the public podcast folder

    Given an mp3 file named "realityexploitroundtable-EP010.mp3"
    When the mp3 file is transferred to the public podcast folder
    Then the mp3 file should exist in this public podcast folder
    And the file should be accessible from the public URL

  @publishing-post
  Scenario: Publishing a post to the website with all episode information

    Given an mp3 file named "realityexploitroundtable-EP010.mp3"
    And an episode number of "10"
    When the show notes are retrieved from github
    And the episode post is published to the website
    Then the episode post should be seen on the website
    And the episode post title should be the mp3 file id3 tags value
    And the episode post body should be the show notes body
    And the episode post mp3 url should be the public_url + mp3 filename
    And the episode category should be Reality Exploit Roundtable






















