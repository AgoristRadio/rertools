@rerlibs
@uploading
Feature: Uploading the mp3 and website post to the public
  In order to automate the publishing of a podcast episode
  As a podcast publisher
  I want to be able to automatically push the podcast file and post to the public

  @uploadingmp3
  Scenario: Uploading a prepared mp3 file to the public podcast folder

    Given an episode filename of "realityexploitroundtable-EP010.mp3"
    When the mp3 file is transferred to the public podcast folder
    Then the mp3 file should exist in this public podcast folder
    And the file should be accessible from the public URL

  @uploadingpost
  Scenario: Posting the episode to the website

    Given an episode filename of "realityexploitroundtable-EP010.mp3"
    When the show notes are retrieved from source "github"
    And the episode post is uploaded to the website
    Then the episode post should be seen on the website























