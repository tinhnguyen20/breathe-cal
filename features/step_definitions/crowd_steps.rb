Given(/^I touch the add marker CTA$/) do
  find("#marker-cta").click
end

Given(/^I click on the map$/) do
  find("#map").click # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" when it loads$/) do |arg1|
  wait_until { page.has_content?(arg1)}
  if page.respond_to? :should
    page.should have_content(arg1)
  else
    assert page.has_content?(arg1)
  end
end


def wait_until
  require "timeout"
  Timeout.timeout(Capybara.default_max_wait_time) do
    sleep(0.1) until value = yield
    value
  end
end