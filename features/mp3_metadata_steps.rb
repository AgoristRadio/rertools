
Given /^an mp3 file named "(.*?)"$/ do |mp3_filename|
  # TODO mp3 path should not be hardcoded
  @mp3_filename = "features/support/" + mp3_filename
  @mp3 = Rertools::Mp3.new(@mp3_filename)
  @mp3.exists?.should == true

end

When /^the mp3 file is updated with the show notes metadata$/ do
  @mp3.set_metadata(@show_notes)
end

Then /^the mp3 file's id3 tag for "(.*?)" should be "(.*?)"$/ do |tagname, tagvalue|
  mp3 = Rertools::Mp3.new(@mp3_filename)
  mp3.send(tagname).should == tagvalue
end

Then /^the mp3 file's id3 tag for "(.*?)" should contain "(.*?)"$/ do |tagname, tagvalue|
  mp3 = Rertools::Mp3.new(@mp3_filename)
  mp3.send(tagname).match(/#{tagvalue}/).should_not be nil
end

