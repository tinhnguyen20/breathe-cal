Feature: Weather and Allergen Forecast
    As an allergy sufferer
    In order to know what type of preventions to take for the current day
    I need to retrieve data from accuweather using the city data that was searched
    
    Background: 
        Given I am on the new city page
        And I fill in "city_name" with "Berkeley"
        And I fill in "city_zip" with "94704"
        And I fill in "city_state" with "CA"
        And I fill in "city_country" with "US"
        And I press "Submit"

    Scenario: 
        Then I should see "AirQuality"
        And I should see "Grass"   
        And I should see "Mold"
        And I should see "Ragweed"
        And I should see "Tree"
        And I should see "Berkeley"
        And I should not see "Fremont"
        