Feature: Locations Details 
    So I can know the branding for the app,
    I want to see the Breathe California Logo
      
Background: 

@javascript
Scenario: I should be able to see the lung logo when searching for a city's allergn 
    Given I am on the landing page
    Then I should see an icon "lung"
    And my location is set to "Berkeley"
	And I should see an icon "lung"
	
@javascript
Scenario: I should notice the breathe for bay area more noticable. 
    Given I am on the landing page
    Then I should see an icon "bcal" 
    And my location is set to "Berkeley"
	And I should see an icon "bcal"
	
