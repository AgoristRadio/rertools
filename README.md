# Don't even think about using this yet. Not even Alpha. But wanted to start the repo.


# Rertools

Reality Exploit Roundtable Automated Full Stack Podcast Publishing Tool
###

Given an episodes mp3 file, say realityexploitroundtable-EP010.mp3 with no id3v2 metadata
And shownotes of https://github.com/AgoristRadio/RealityExploitRoundtable/blob/master/EP010.md
When you run the command line tool: "rer publish realityexploitroundtable-EP010.mp3"
Then the episdode show notes information is downloaded and parsed for metadata
And the metadata is injected into the MP3's id3v2 tags
And the metadata & show notes are injected into a new Episode Post on the RER Website
And the MP3 is uploaded to the public website

## Installation

Add this line to your application's Gemfile:

    gem 'rertools'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rertools

## Usage

rer help

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
