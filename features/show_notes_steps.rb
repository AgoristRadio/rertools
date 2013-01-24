
# Parsing
Given /^an episode number of "(.*?)"$/ do |episode_number|
  @episode_number = episode_number
end

Given /^show notes with body$/ do |raw_show_notes|
  @show_notes = Rertools::ShowNotes.new(@episode_number,raw_show_notes)
end

Then /^the "(.*?)" should be "(.*?)"$/ do |property, value|
  @show_notes.send(property).should == value
end

Then /^the "(.*?)" should include "(.*?)"$/ do |list, item|
  @show_notes.send(list).include?(item).should == true
end

# Retrieving
When /^the show notes are retrieved from github$/ do
    @show_notes = Rertools::ShowNotes.new(@episode_number)
end
