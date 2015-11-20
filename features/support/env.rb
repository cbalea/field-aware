require 'rspec/expectations'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

require_relative 'test_constants'

World(TestConstants)

def get_driver
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 10 # seconds

  Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 10
    config.app_host = TestConstants.url #this presets app_host, then you only use relative urls when loading pages; for instance load('/cars/')
    config.run_server = false
    config.ignore_hidden_elements = false
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => client)
  end
end

Before do |scenario|
  @driver = get_driver
end

def take_screenshot
  result_hash = Capybara::Screenshot.screenshot_and_save_page
  image = result_hash[:image].split('/')[-1]
  encoded_image = Base64.encode64(File.open(Dir.pwd + "/features/reports/" + image, 'rb').read)
  embed("data:image/png;base64,#{encoded_image}", 'image/png')
end

After do |scenario|
  take_screenshot if scenario.failed?
end