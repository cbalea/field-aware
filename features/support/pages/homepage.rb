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

    def find_sub_menu_link(label)
      # simple find_link(title) throws Capybara::Ambiguous
      if label.include?("'")

        xpath = "//ul[@class='dropdown-menu']/..//a["

        # escaping the ' characted in xpath is not working
        # we will split the label into pieces and use xpath's contains() method
        label_pieces = label.split("''")
        label_pieces.each do |piece|
          xpath += "contains(@title, '#{piece}') and "
        end
        xpath.chomp(" and ")  # remove unneeded trailing "and"
        xpath += "]"          # close xpath

        find(:xpath, xpath)
      else
        find(:xpath, "//ul[@class='dropdown-menu']/..//a[@title='#{label}']")
      end
    end


  end

end