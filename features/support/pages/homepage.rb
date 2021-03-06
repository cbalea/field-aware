require 'site_prism'

module PageObjects

  class Homepage < SitePrism::Page

    ### this section is written to demonstrate usage of the SitePrism ruby gem #######
    ###  see https://github.com/natritmeyer/site_prism#summary-of-what-the-element-method-provides
    set_url "{url}"

    element :nav_bar, :xpath, "//ul[@class='nav navbar-nav pull-right-sm']"

    element :product_button, :xpath, "//a[@title='Product']"
    element :industry_button, :xpath, "//a[@title='Industry']"
    element :solutions_button, :xpath, "//a[@title='Solutions']"
    element :clients_button, :xpath, "//a[@title='Clients']"
    element :resources_button, :xpath, "//a[@title='Resources']"
    element :company_button, :xpath, "//a[@title='Company']"
    element :get_a_demo_button, :xpath, "//button[contains(text(), 'Get a Demo')]"
    ### end of SitePrism section ###

    def button_labeled(label)
      find_link(label)
    end

    def button_has_dropdown_arrow? (button)
      menu_btn = button_labeled(button)
      return menu_btn["data-toggle"] == "dropdown"
    end

    def sub_menu(menu)
      find(:xpath, "//a[@title='#{menu}']/following-sibling::ul[@class='dropdown-menu']")
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