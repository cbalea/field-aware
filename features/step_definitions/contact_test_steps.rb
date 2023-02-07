Given(/^I load the Contact page$/) do
  @contact_page = PageObjects::ContactPage.new
  @contact_page.load_page
end

Then(/^I can fill the form$/) do
  @contact_page.fill_form
end