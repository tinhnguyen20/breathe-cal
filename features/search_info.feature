Feature: Map and Search WebPage Integration
    As an allergy sufferer
    In order to know what type of preventions to take for the current day and look at the map at the same time
    I need to link getting the accuweather data to the google maps search bar AJAX action.
 
@javascript
Scenario: Verifying that information is displayed on Map Page 
    Given I am on the landing page
    And my location is set to "Berkeley"
    Then I should see "Good" next to "Grass"
