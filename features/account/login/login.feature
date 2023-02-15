@ui
@user_login
Feature: Juice Shop - User Login
  Navigate to OWASP Juice Shop and perform Successful and Unsuccessful log ins.

  Background:
    Given I navigate to the Juice Shop application

  Scenario: Unsuccessful Login
    When I click on the header Account button
    And I click on the header Login button
    Then the Log in button is disabled
    When I provide invalid credentials
    Then the Log in button is enabled
    When I click on the Log in button
    Then the user login attempt is unsuccessful

  Scenario: Successful Login
    When I click on the header Account button
    And I click on the header Login button
    Then the Log in button is disabled
    When I provide valid credentials
    Then the Log in button is enabled
    When I click on the Log in button
    Then the user login attempt is successful