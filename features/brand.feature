Feature: Locations Details 
       As an allergy sufferer, i want to notice the branding
       for Breathe for California for the Bay Area 
      
Background: 

@javascript
Scenario: I should be able to see the lung logo when searching for a city's allergn 
    Given I am on the landing page
    And my location is set to "Berkeley"
	Then I should see the lung logo 
	
@javascript
Scenario: I should notice the breathe for bay area more noticable. 
    Given I am on the landing page
    Then I should see the "breathe" logo 
    And my location is set to "Berkeley"
	And I should see the "breathe" logo 
	
