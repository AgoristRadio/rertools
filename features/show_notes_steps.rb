Given /^an episode filename of "(.*?)"$/ do |mp3_filename|
  @episode = Rertools::Episode.new(Rertools::Config.new.testing_support_path  + mp3_filename)
end

When /^the show notes are retrieved from source "(.*?)"$/ do |source|
  params = {:source => source }
  @episode.retrieve_show_notes(params)
end

When /^the show notes are retrieved from source "(.*?)" with body$/ do |source, raw_show_notes|
  params = {:source => source, :raw_show_notes => raw_show_notes}
  @episode.retrieve_show_notes(params)
end

Then /^the "(.*?)" should be "(.*?)"$/ do |property, value|
  @episode.show_notes.send(property).should == value
end

Then /^the "(.*?)" should include "(.*?)"$/ do |list, item|
  @episode.show_notes.send(list).include?(item).should == true
end
