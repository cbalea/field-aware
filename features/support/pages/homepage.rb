require 'capybara'
require 'capybara/dsl'

module PageObjects

  class Homepage
    include Capybara::DSL

    private def nav_bar; find(:id, "masthead"); end
    private def get_a_demo_button; find(:xpath, "//li[@id='masthead-menu-items-demo']/descendant::span[contains(text(), 'Get a Demo')]"); end
    private def platform_tour_button; find(:xpath, "//li[@id='masthead-menu-items-tour']/a"); end
    private def find_your_solution_button; find(:xpath, "//li[@id='masthead-menu-items-solution']/a"); end
    private def button_labeled(label); find(:xpath, "//div[@class='uk-navbar-right']/descendant::a/span[contains(text(), '" + label + "')]/parent::a"); end
    private def sub_menu(parent_label); find(:xpath, "//span[contains(text(), '" + parent_label + "')]/parent::a/following-sibling::div[contains(@class, 'uk-navbar-dropdown')]"); end

    def load_page
      visit TestConstants.url
    end

    def has_loaded?
      nav_bar.visible?
    end

    def can_expand_submenu? (label)
      return button_labeled(label)["aria-expanded"] != nil
    end

    def sub_menu_visible?(menu)
      begin
        sub_menu(menu).visible?
      rescue Capybara::ElementNotFound
        return false
      end
    end

    def sub_menu_link(label)
      # a simple find_link throws Ambiguity error
      find(:xpath, '//ul[@class="dropdown-menu"]/..//a[@title="' + label + '"]')
    end

    def element_is_positioned_before(first_element, last_element)
      (first_element.native.location.x.to_i < last_element.native.location.x.to_i) or
      (first_element.native.location.y.to_i < last_element.native.location.y.to_i)
    end


  end

end