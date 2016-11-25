Feature: Favorite Locations 
    As an allergy sufferer
    in order to quickly look for allergen information,
    I need to be able to favorite locations,
    and access information for them by clicking on a button

@javascript #happy path, logged in
Scenario: Once I sign in, I should be able to favorite a city
     Given I successfully authenticated with Google as "Anish Khazane"
     When I go to the landing page
     And my location is set to "Berkeley"
     And I follow "Add to Favorites?" 
     Then I should see "Added Berkeley to your list of favorite cities!"

@javascript #sadpath, not logged in
Scenario: If not signed in, I should not be able to favorite a city
   When I go to the landing page
   And my location is set to "Berkeley"
   And I follow "Add to Favorites?"
   Then I should see "You must be logged in order to favorite a city!"
   
  
@javascript #sadpath, re-favoriting
Scenario: If a city is favorited, then I should not be able to re-favorite it.
       Given I successfully authenticated with Google as "Anish Khazane"
       When I go to the landing page 
       And my location is set to "Berkeley"
       And I follow "Add to Favorites?"
       Then I should see "Berkeley is already one of your favorite cities!

@javascript #happypath, view of cities
Scenario: If a city is favorited, then I should be able to see a list of them.
       Given I successfully authenticated with Google as "Anish Khazane"
       When I go to the landing page 
       And my location is set to "Berkeley"
       And I follow "Add to Favorites?"
       And I follow "View Favorites"
       Then I should see "Berkeley"
       
@javascript #sadpath, no cities available
Scenario: If a city is favorited, then I should be able to see a list of them.
       Given I successfully authenticated with Google as "Anish Khazane"
       When I go to the landing page 
       And my location is set to "Berkeley"
       And I follow "View Favorites"
       Then I should see "You currently have no favorite cities!"
       
       
