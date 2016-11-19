Feature: authentication
    As an allergy sufferer
    in order to personalize my experience with the application, 
    I should be able to create/sign-in to my personal account
    
@javascript
Scenario: I should see a google plus sign-in icon on the landing page
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
  
@javascript
Scenario: As a logged in user I should be able to logout when I press the sign out link
  Given I am logged in as "James Jones"
  And I am on the landing page
  When I follow "Sign Out"
  Then I should be on the landing page
  And I should not see "James Jones"
  And I should see an icon "google_plus"
  
