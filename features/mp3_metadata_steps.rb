When /^the mp3 file is updated with the show notes metadata$/ do
  @episode.inject_mp3_metadata
end

Then /^the mp3 file's id3 tag for "(.*?)" should be "(.*?)"$/ do |tagname, tagvalue|
  @episode.mp3.send(tagname).should == tagvalue
end

Then /^the mp3 file's id3 tag for "(.*?)" should contain "(.*?)"$/ do |tagname, tagvalue|
  #mp3 = Rertools::Mp3.new(@mp3_filename)
  @episode.mp3.send(tagname).match(/#{tagvalue}/).should_not be nil
end
