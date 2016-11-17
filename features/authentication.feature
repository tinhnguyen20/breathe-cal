Feature: authentication
    As an allergy sufferer
    in order to personalize my experience with the application, 
    I should be able to create/sign-in to my personal account
    
@javascript
Scenario: I should see a google+ sign-in icon on the landing page
  Given I am on the landing page
  Then I should see an icon "google_plus"
  
@javascript
Scenario: If I click on the google plus icon I should  
  Given I am on the landing page
  When I press the icon "google_plus"
  # Then I should be taken to the google authentication page

@javascript
Scenario: If I input legitimate google credentials I should be taken to the homepage as a user
  Given I successfully authenticated with Google as "James Jones"
  Then I should be on the landing page
  And I should see the text on the side "James Jones"
  And I should not see "Some Guy"
  And I should see the button "Sign Out"
  
# @javascript
# Scenario: As a logged in user I should be able to logout when I press the sign out link
#   Given I am logged in as "James Jones"
#   When I click 

# @javascript
# Scenario: On the sign-up page I should see email, password, password confirmation fields and a sign-up button
#   Given I am on the sign_up page 
#   Then I should see the field "Email"
#   And I should see the field "Password"
#   And I should see the field "Password Confirmation"
#   And I should see the button "Sign Up"
 
# @javascript
# Scenario: If I input the info and click Sign-Up I should be taken to the user homepage
#   Given I am on the sign_up page 
#   When I fill in "Email" with "JohnWayne@gmail.com"
#   And I fill in "Password" with "12345"
#   And I fill in "Password Confirmation" with "12345"
#   And I press "Sign Up"
#   Then I should be on the user homepage
  
# @javascript
# Scenario: On the sign-in page I should see email, password fields and a sign-in button
#   Given I am on the sign_in page 
#   Then I should see the field "Email"
#   And I should see the field "Password"
#   And I should see the button "Sign In"
 
# @javascript
# Scenario: If I input the info and click Sign-In I should be taken to the user homepage
#   Given I am on the sign_in page 
#   When I fill in "Email" with "JohnWayne@gmail.com"
#   And I fill in "Password" with "12345"
#   And I press "Sign In"
#   Then I should be on the user homepage
  
  
  