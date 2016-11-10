Feature: Favorite Locations 
    As an allergy sufferer
    in order to quickly look for allergen information,
    I need to be able to favorite locations,
    and access them by clicking on a button

@javascript #happy path
 Scenario: Add a city to a favorite list
    When I am on the city detail page of ‘Berkeley’
    Then I should see plus button
    When I follow the plus button
    Then I should see text on the side "Favorite Cities"
    When I follow "Favorite Cities"
	And I should see a dropdown of "Berkeley"
 
@javascript #happy path 
Scenario: Navigate from my favorite cities
    When I am on the city detail page of ‘Berkeley’
    Then I should see plus button
    When I follow the plus button
    Then I set my location to "San Francisco" 
    Then I should see plus button
    When I follow the plus button
    Then I follow "Favorite Cities"
    Then I follow "Berkeley"
    Then I should see more details about the "tree" pollen
    Then I follow "San Francisco"
    Then I should see more details about the "grass" pollen