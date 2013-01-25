# MP3
When /^the mp3 file is transferred to the public podcast folder$/ do
  @episode.upload_mp3.should == true
end

Then /^the mp3 file should exist in this public podcast folder$/ do
  @episode.remote_mp3_exists?.should == true
end

Then /^the file should be accessible from the public URL$/ do
  @episode.remote_mp3_url_works?.should == true
end

# POST
When /^the episode post is uploaded to the website$/ do
  @episode.upload_post.should == true
end

Then /^the episode post should be seen on the website$/ do
  @episode.uploaded_post_exists?.should == true
end
