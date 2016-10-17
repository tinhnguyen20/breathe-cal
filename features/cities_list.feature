Feature: display a list of added cities
	As an allergy sufferer
	So that I can keep track of cities that i care about
	I want to see a list of cities that i have added

    Background: 
        Given I am signed in
        And that the cities that have been added:
    	“X”, “Y”, “Z”
	
    Scenario: See all cities
	    Given that I am on the city list page
	    Then I should see "X"
	    And I should see "Y"
	    And I should see "Z"

    Scenario: Remove city
	    Given that I press X on city “X” #garbage can button? idk.
	    Then I should be on the city list page
	    And I should not see city “X” 
