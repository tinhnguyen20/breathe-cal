Feature: display a list of added cities
	As an allergy sufferer
	So that I learn more about the allern
	I want to be able to view more iformation

    Background: 
        Given the site is up 
        And user is on the “Berkeley” details page 

    Scenario:
        When I click on “pollen“ allergy  
        Then I should see text in the “pollen” section 
        
    