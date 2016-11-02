Feature: Locations 
     As an allergy sufferer in order to know the allergen data 	
     and weather data, I should be able to clearly be able to     
     visualize the data (utilizing colors and graphs)  and be able 
     to clearly understand the information on the page.   
    
Background: 
	
Scenario: I should be able to open the page on a desktop understand the purpose of the page 
    When I go to the landing page
	Then I should see a "map" 
	And I should see an "search box" in the map 
	    And I should see "enter a location to learn allergns"
	And I should see the right toolbar with the text "find important allergy information here!"
	

Scenario: I should be able to see the current date 
    When I go to the landing page
	Then I should see a "right  - toolbar" 
	And I should see the "date and time" 
	And I should see the right toolbar with an "image"

Scenario: I should be able to see the allergn details of the page 
	When I go to the landing page
	When I fill out "Berkeley" 
	And I press "enter: 
	And I should see a new "image"
    And I should see a "tree-icon"
    And I should see a "grass-icon
    And I should see a "ragweed-icon"
    And I should see a "mold-icon"
    And I should see a "uvindex-icon"

        
Scenario: I should be able to see the allergn level of the page 
	When I go to the landing page
	When I fill out "Berkeley" 
	And I press "enter: 
	And I should see a new "image"
    And I should see a "tree-icon"
    And I should see a "level-icon" 
    And I should see a "level-text"
        
Scenario: I should be able to see the breathing details of the page 
	When I go to the landing page
	When I fill out "Berkeley" 
	And I press "enter: 
	And I should see a new "image"
    And I should see a "precip-icon"
    And I should see a "wind-icon"
    And I should see a "precip-text"
    And I should see a "wind-text"
    
Scenario: I should be able to see the other forcasts details of the page 
	Given I am on the landing page
	When I fill out "Berkeley" 
	And I press "enter: 
	And I should see a new "image"
    And I should see a "level-icon"
    And I should see a "date"
    And I should see a "level-text"
    
Scenario: Having searched a city and pressing back I should see recent searches 
    When I go to the landing page
	When I fill out "Berkeley" 
	And I press "enter:
	And I press "back"
	Then I should see "Berkeley"
	And I should see a new "image"
    And I should see a "level-icon"
    And I should see a "level-text"