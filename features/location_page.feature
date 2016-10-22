Feature: Locations 
    As an allergy sufferer
    in order to look for allergens for a location,
    I need to be able to see nearby locations, 
    search for a location, and add locations as favorites. 

    Background: 
        Given the site is set up 

    Scenario: 
        When I search for a city “Berkeley” 
        Then I should see “Berkeley, CA” on the list of autocompleted cities 

    Scenario: 
        When I am not signed in
        Then I should see nearby cities 

    Scenario: 
        Given there are cities shown
        And I am signed in 
        And I click on the plus sign besides the city
        Then I should see the plus sign changes into a check mark
