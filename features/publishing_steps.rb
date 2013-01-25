When /^the episode is fully published to the world$/ do
  @episode.publish.should == true
end
