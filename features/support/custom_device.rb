Capybara.register_driver :iphone do |app|

  require 'selenium/webdriver'
  profile = Selenium::WebDriver::Firefox::Profile.new

  #Change the line below to change the user agent
  profile['general.useragent.override'] = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"

  Capybara::Selenium::Driver.new(app, :profile => profile)
end

Capybara.use_default_driver