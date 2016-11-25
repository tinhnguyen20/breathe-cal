Feature: Favorite Locations 
    As an allergy sufferer
    in order to quickly look for allergen information,
    I need to be able to favorite locations,
    and access information for them by clicking on a button

#happy path, favoriting a city 
@javascript 
Scenario: Once I sign in, I should be able to favorite cities 
    Given I successfully authenticated with Google as "Anish Khazane"
    When I go to the landing page
    And my location is set to "Berkeley"
    And I follow "Add to Favorites?" 
    Then I should see "Added Berkeley to your list of favorite cities!"
    
#sad path, not signed in
@javascript 
Scenario: If not signed in, I should not be able to favorite a city
    When I go to the landing page
    And my location is set to "Berkeley"
    And I follow "Add to Favorites?" 
    Then I should see "You must be logged in order to favorite a city!"
 
#sad path, no re-favoriting
@javascript
Scenario: If a city is already favorited, I should not be able to favorite it again
    Given I successfully authenticated with Google as "Anish Khazane"
    When I go to the landing page
    And my location is set to "Berkeley"
    And I follow "Add to Favorites?" 
    Then I should see "Added Berkeley to your list of favorite cities!"
    And I follow "Add to Favorites?"
    Then I should see "Berkeley is already one of your favorite cities!"
    
#happy path, favorite cities list    
@javascript 
Scenario: I should be able to see a list of my favorite cities 
    Given I successfully authenticated with Google as "Anish Khazane"
    When I go to the landing page
    And my location is set to "Berkeley"
    And I follow "Add to Favorites?" 
    And I follow "View Favorites"
    Then I should see "Berkeley"
 
#sadpath, no favorite cities       
@javascript 
Scenario: If no cities are favorited, then I should see an empty list.
      Given I successfully authenticated with Google as "Anish Khazane"
      When I go to the landing page 
      And my location is set to "Berkeley"
      And I follow "View Favorites"
      Then I should see "You currently have no favorite cities!"
       
       
