require 'rspec/expectations'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'capybara-screenshot/cucumber'

require_relative 'test_constants'

World(TestConstants)

def get_driver
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 60 # seconds: timeout for wait while url loads


  Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 10 # maximum time to wait for an element to be visible before interacting with it
    config.app_host = TestConstants.url
    config.run_server = false
    config.ignore_hidden_elements = false
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => client)
  end

  window = Capybara.current_session.driver.browser
  window.manage.window.maximize
end

Before do |scenario|
  @driver = get_driver
end

def take_screenshot
  Capybara::Screenshot.final_session_name = nil
  Capybara::Screenshot.autosave_on_failure = true
  Capybara.save_and_open_page_path = "features/reports"
end

After do |scenario|
  take_screenshot if scenario.failed?
end