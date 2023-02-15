When(/^I navigate to the (Juice Shop) application$/) do |_application|
  # Typically would map urls for navigation in a yaml.
  @driver.navigate.to "https://juice-shop.herokuapp.com/"

  # Clear welcome banner
  @driver.find_element(:xpath, "//button[@aria-label='Close Welcome Banner']").click
end