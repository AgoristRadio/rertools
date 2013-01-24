# Publishing the MP3

When /^the mp3 file is transferred to the public podcast folder$/ do
  @uploader = Rertools::Mp3Uploader.new(Rertools::Config.new, @mp3_filename)
  @uploader.upload.should == true
end

Then /^the mp3 file should exist in this public podcast folder$/ do
  @uploader.remote_exists?.should == true
end

Then /^the file should be accessible from the public URL$/ do
  @uploader.url_accessible?.should == true
end

# Publishing the Post to the Website


When /^the episode post is published to the website$/ do
  poster = Rertools::EpisodePoster.new(Rertools::Config.new, @mp3_filename, @show_notes)
  #poster.ping_remote.should == "sdfsfs"
  poster.post.should == true
end

Then /^the episode post should be seen on the website$/ do
 # pending # express the regexp above with the code you wish you had
end

Then /^the episode post title should be the mp(\d+) file id(\d+) tags value$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
end

Then /^the episode post body should be the show notes body$/ do
  #pending # express the regexp above with the code you wish you had
end

Then /^the episode post mp(\d+) url should be the public_url \+ mp(\d+) filename$/ do |arg1, arg2|
  #pending # express the regexp above with the code you wish you had
end

Then /^the episode category should be Reality Exploit Roundtable$/ do
  #pending # express the regexp above with the code you wish you had
end
