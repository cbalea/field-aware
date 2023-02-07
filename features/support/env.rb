require 'rspec/expectations'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'
require 'webdrivers'

require_relative 'test_constants'

World(TestConstants)

def get_driver
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 60 # seconds: timeout on wait for the url to load

  Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 10 # seconds: maximum time to wait for an element to be visible before interacting with it
    config.run_server = false
    config.ignore_hidden_elements = false
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => client)
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
  # Capybara.save_and_open_page_path = "features/reports"
end

After do |scenario|
  take_screenshot if scenario.failed?
end