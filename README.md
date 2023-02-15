Justin Mitchell - Automated tests for Juice Shop using Ruby/Cucumber with Selenium Webdriver.

Feature 1: User Login
 - Successful Login.
 - Unsuccessful Login.

Feature 2: Product Search
 - Search expected products.
 - Search product not found.
 - Search bar manipulation.
 
 Additional notes:
  - Webdriver is created before scenarios tagged @ui.
  - Webdriver is closed after scenarios tagged @ui.
  
  
Console Execution: 
 - cucumber features -t [tag]

Included Tags:
 - @product_search
 - @user_login
 
 ![Capture9](https://user-images.githubusercontent.com/125304857/218920165-98c0ab2b-bc88-442e-84bd-d4ea4d2a0169.JPG)
