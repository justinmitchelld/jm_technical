When(/^I click on the header (Account|Login) button$/) do |id|
  button = case id
               when 'Account'
                 'navbarAccount'
               when 'Login'
                 'navbarLoginButton'
               else
                 raise "Unexpected header button: #{id}"
               end

  @driver.find_element(id: button).click
end

When(/^I provide (valid|invalid) credentials$/) do |state|
  case state
  when 'valid'
    # Typically sensitive test data would be stored in an encrypted yaml.
    username = 'valid@test.com'
    password = '!1A2b345678'
  when 'invalid'
    username = 'invalid@test.com'
    password = 'password'
  else
    raise "Unexpected credentials state: #{state}"
  end

  @driver.find_element(name: 'email').send_keys username
  @driver.find_element(name: 'password').send_keys password
end

When(/^I click on the Log in button$/) do
  @driver.find_element(id: 'loginButton').click
end

Then(/^the Log in button is (enabled|disabled)$/) do |state|
  login_button = @driver.find_element(id: 'loginButton')

  button_state = case state
                 when 'enabled'
                   true
                 when 'disabled'
                   false
                 else
                   raise "Unexpected button state: #{state}"
                 end

  expect(login_button.enabled?).to be button_state
end

Then(/^the user login attempt is (successful|unsuccessful)$/) do |state|
  error_msg = @driver.find_elements(:xpath, "//div[contains(text(), 'Invalid email or password.')]")

  case state
  when 'successful'
    expect(error_msg).to be_empty, 'Invalid email or password.'
  when 'unsuccessful'
    expect(error_msg.first.text).to eq('Invalid email or password.')
  else
    raise "Unexpected login state: #{state}"
  end
end