require 'capybara'
require 'capybara/dsl'
require 'rspec/expectations'

module PageObjects

  class ContactPage
    include Capybara::DSL
    include RSpec::Matchers # to be able to access expect() in page objects

    private def first_name_input; find(:id, "LblFirstName"); end

    def load_page
      visit (TestConstants.url + "/contact/")
    end

    def fill_form
      fill_in("First Name:", with: 'John')
      select('Romania', from: 'Country:')
      check('Receive FieldAware Emails:')
      choose('Purchase FieldAware')
    end

  end

end