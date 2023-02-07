Given(/^I load the FieldAware page$/) do
  @homepage = PageObjects::Homepage.new
  @homepage.load_page
end

Then(/^the navigation widget is displayed$/) do
  expect(@homepage).to have_loaded
end

And(/^the menu buttons are in the correct order$/) do
  expect(@homepage.element_is_positioned_before(@homepage.get_a_demo_button, @homepage.platform_tour_button)).to be true
  expect(@homepage.element_is_positioned_before(@homepage.platform_tour_button, @homepage.find_your_solution_button)).to be true
end

Then(/^the (.*) button (.*) expand a sub-menu$/) do |btn, option|
  if option == "can"
    expect(@homepage.can_expand_submenu?(btn)).to be true
  elsif option == "can't"
    expect(@homepage.can_expand_submenu?(btn)).to be false
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