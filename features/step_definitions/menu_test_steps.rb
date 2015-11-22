Given(/^I load the FieldAware page$/) do
  @homepage = PageObjects::Homepage.new
  @homepage.load
end

### this section is written to demonstrate usage of the SitePrism ruby gem #######
###  see https://github.com/natritmeyer/site_prism#summary-of-what-the-element-method-provides
Then(/^the navigation widget is displayed$/) do
  @homepage.wait_until_nav_bar_visible
end

And(/^the menu buttons are displayed$/) do
  @homepage.wait_until_product_button_visible
  @homepage.wait_until_industry_button_visible
  @homepage.wait_until_solutions_button_visible
  @homepage.wait_until_clients_button_visible
  @homepage.wait_until_resources_button_visible
  @homepage.wait_until_company_button_visible
  @homepage.wait_until_get_a_demo_button_visible
end
### end of SitePrism section ###

And(/^the menu buttons are in the correct order$/) do
  expect(@homepage.element_is_positioned_before(@homepage.product_button, @homepage.industry_button)).to be true
  expect(@homepage.element_is_positioned_before(@homepage.industry_button, @homepage.solutions_button)).to be true
  expect(@homepage.element_is_positioned_before(@homepage.solutions_button, @homepage.clients_button)).to be true
  expect(@homepage.element_is_positioned_before(@homepage.clients_button, @homepage.resources_button)).to be true
  expect(@homepage.element_is_positioned_before(@homepage.resources_button, @homepage.company_button)).to be true
  expect(@homepage.element_is_positioned_before(@homepage.company_button, @homepage.get_a_demo_button)).to be true
end

Then(/^the (.*) button (.*) a dropdown arrow$/) do |btn, option|
  if option == "has"
    expect(@homepage.button_has_dropdown_arrow?(btn)).to be true
  elsif option == "doesn't have"
    expect(@homepage.button_has_dropdown_arrow?(btn)).to be false
  end
end

Then(/^I click the (.*) button, the sub\-menu (.*) displayed$/) do |btn, option|
  @homepage.button_labeled(btn).click
  if option == "is"
    expect(@homepage.sub_menu_visible?(btn)).to be true
  elsif option == "isn't"
    expect(@homepage.sub_menu_visible?(btn)).to be false
  end
end

When(/^I click the (.*) button$/) do |btn|
  @homepage.button_labeled(btn).click
end

And(/^the following links are displayed in the correct order: (.*)$/) do |all_links|
  separate_links = all_links.split(", ")
  for i in (0..separate_links.length-1)
    expect(@homepage.sub_menu_link(separate_links[i]).visible?).to be true
    if i < separate_links.length-1
      expect(@homepage.element_is_positioned_before(
                   @homepage.sub_menu_link(separate_links[i]),
                   @homepage.sub_menu_link(separate_links[i+1])))
            .to be true
    end
  end
end