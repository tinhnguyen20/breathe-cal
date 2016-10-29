Given /the following clients exist/ do |clients_table|
  clients_table.hashes.each do |client|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  Client.create!(client)
  end
  # fail "Unimplemented"
end

Given /I as "(.*)" have searched for "(.*)"$/ do |client, city|
    #we will implement this model method later
    # Client.addToClient(client, city)
    visit(get controller: 'clients', action: 'index', client: client, city: city)
end

And /I should see "(.*)" below "(.*)"$/ do |city1, city2|
  #  ensure that that city1 occurs before city2.
  #  page.body is the entire content of the page as a string.
  #fail "Unimplemented"
  expect page.body.match ("^.*#{city2}.*#{city1}")
end

Then /I should see an empty search history/ do
    #pending
end 

Given /I am on the user's page of "(.*)"/ do |user|
  visit('/clients/1')
end 

