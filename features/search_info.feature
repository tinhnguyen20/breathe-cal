Feature: Map and Search WebPage Integration
    As an allergy sufferer
    In order to know what type of preventions to take for the current day and look at the map at the same time
    I need to link getting the accuweather data to the google maps search bar AJAX action.
  
Background: 
    Given the site is set up 

@javascript
Scenario: Verifying that information is displayed on Map Page 
    Given I am on the landing page
    And the map has been loaded 
    And I have searched for "Berkeley"
    Then I should see "Wood Pollen" within "Information"
    Then I should see "AirQuality" within "Information"
    Then I should see "Grass" within "Information"
    Then I should see "Mold" within "Information"
    Then I should see "Ragweed" within "Information"
    Then I should see "Tree" within "Information"
    Then I should see "Berkeley" within "Information"
    Then I should not see "Fremont" within "Information"
    Then the center of the map should be approximately "Berkeley"
    And the center of the map should not be approximately "Chicago"