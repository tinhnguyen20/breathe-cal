Feature: Locations Details 
      As an allergy sufferer, i want to know more information about
      the allergen and what each level actually stands for.    
      
Background: 

@javascript
Scenario: I should be able to hover over air quaility levels to see more information. 
    Given I am on the landing page
    And my location is set to "Berkeley"
	And I hover over the air quaility 
	And I should see more information about air quaility 

  
@javascript
Scenario: I should be able to click on a pollen and see detail information. 
    Given I am on the landing page
    And my location is set to "Berkeley"
	And I click on "tree" pollen
	And I should see more details about the "tree" pollen 
	
@javascript
Scenario: I should be able to click on a pollen and see detail information. 
    Given I am on the landing page
    And my location is set to "Berkeley"
	And I click on "ragweed" pollen
	And I should see more details about the "ragweed" pollen 
    And I should not see more details about the "tree" pollen 
  
@javascript
Scenario: I should be able to see where the data is taken from. 
    Given I am on the landing page
    And my location is set to "Berkeley"
	And I should see that the data is from accruweather 


  
  