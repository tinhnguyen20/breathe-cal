Feature: Locations 
    As an allergy sufferer
    In order to know what to medicine to take or to bring
    I want to be able to view daily pollen and allergn count
  
    Background: 
        Given the site is set up 


    Scenario: 
        Given I see a list of cities in the dropdown 
        When I click on “Berkeley, CA”
        Then I should see information about “Berkeley”
        And I should not see “Boston”
        And I should not see “Brooklyn”
        And I should see a link “pollin”
        And I should see icon “favorite”

    Scenario: 
        Given I see a list of cities in my favorites list 
        When I click on “Berkeley, CA”
        Then I should see information about “Berkeley”
        And I should not see “Boston”
        And I should not see “Brooklyn”
        And I should see a link “pollin”
        And I should see icon “favorite”
