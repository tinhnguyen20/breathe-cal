Feature: Favorite Locations 
    As an allergy sufferer
    in order to quickly look for allergen information,
    I need to be able to favorite locations,
    and access them by clicking on a button

@javascript #happy path
 Scenario: Having added a favorite city, I should see it in my views page.
   Given I successfully authenticated with Google as "Anish Khazane"
    When I go to the landing page
    And my location is set to "Berkeley"
    And I follow "Add to Favorites?"
    Then I should see the text on the side "Added Berkeley to Favorite Cities!"
