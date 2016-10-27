Feature: Locations 
     As an allergy sufferer in order to know the allergen data 	
     and weather data, I should be able to clearly be able to     
     visualize the data (utilizing colors and graphs)  and be able 
     to clearly understand the information on the page.   
    
Background: 
    Given the site is set up 
Scenario: 
    Given I open the page 
    And I open the page on a “Desktop” 
    Then I should see the “allergy” to the right of the map 

Scenario: 
    Given I open the page 
    And I open the page on a “Mobile” 
    Then I should see the “allergy” to the bottom of the map 

Scenario: 
	Given I open the page 
	Then I should see a “toolbar” 
	And I should see an “image” 
	And I should see a “right  - toolbar” 

Scenario: 
	Given I open the page 
	Then I should see a “right  - toolbar” 
	And I should see the “date and time” 
	And I should see the right toolbar with an “image”

Scenario: 
	Given I open the page 
	When I fill out “Berkeley” 
	And I press “enter: 
	And I should see a new “image”
        And I should see a “weather-icon”
        And I should see a “pollen-icon”
        And I should see a “level-text”