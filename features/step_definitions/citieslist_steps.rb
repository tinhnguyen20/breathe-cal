Given(/^that the cities that have been added:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  # User should follow the city based on table.. 
  #User.follow(table.hash or something)
  table.hashes.each do |city|
    User.add_city_by_name(city)
  end
end

Given(/^that I press X on city list entry “([^"]*)”$/) do |city|
  # tell it to do something. 
  click_button("unfollow_#{city}")
end