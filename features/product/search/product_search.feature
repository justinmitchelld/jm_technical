@ui
@product_search
Feature: Juice Shop - Product Search
  Navigate to OWASP Juice Shop and perform a series of product searches.
  Validate product search results with expected outcomes.

  Background:
    Given I navigate to the Juice Shop application

  Scenario: Validate Product Search Results
    When I search for a product and validate results
      | product         | size | exists |
      | Apple Juice     | 1000 | true   |
      | Lemon Juice     | 500  | true   |
      | Juice Shop Card |      | true   |
      | Fake Product    |      | false  |