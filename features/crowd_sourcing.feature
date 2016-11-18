# Feature: crowd sourcing 
#   As an allergy sufferer with a user account
#   in order to provide other sufferers with more granular allergen data, 
#   I should be able to place a marker on the map that provides information about a place.

# Background:
#   Given I am on the landing page
#   And I am logged in

# @javascript  
# Scenario: If I click the add marker CTA I can choose to add a marker to my current location.
#   Given I click on "Add an Allergy Warning to the Map"
#   Then I should see the "Use My Current Location" option
#   And I should see the "Search for a Place to add an Allergy Warning" option
#   Given I click "Use My Current Location"
#   Then I should see a list of allergens to check off.
#   Given that I check off "Cats"
#   And I press "Add My Marker"
#   Then I should see a marker at "My Current Location"
#   Given that I click on that marker
#   Then I should see "Cats" listed as an allergen
#   Given that I search for somewhere far away from my current location
#   Then I should not see the marker I added


# @javascript
# Scenario: If I click the add marker CTA I can choose to add a marker to the location searched.
#   Given I click on "Add an Allergy Warning to the Map" 
#   Then I should see the "Use My Current Location" option
#   And I should see the "Search for a Place to add an Allergy Warning" option
#   Given I click on "Search for a Place to add an Allergy Warning"
#   Then I should see a new search bar.
#   Given I fill in the new search bar with "Berkeley City College"
#   Then I should see a list of allergens to check off.
#   Given that I check off "Cats"
#   And I press "Add My Marker"
#   Then I should see a marker at "My Current Location"
#   Given I search for "Los Angeles"
#   Then I should not see the marker I added
#   And I search for "Berkeley City College"
#   Then I should see the marker
#   Given that I click on the marker that I just added
#   Then I should see "Cats" as an allergen.
  
# @javascript
# Scenario: If I click on the add marker CTA I can go back to the previous view
#   Given my location is set to "Berkeley"
#   Given I click on "Add an Allergy Warning to the Map"
#   Then I click back
#   Then I should see "Berkeley"
  
# @javascript
# Scenario: If I don't choose an allergen from the list, I cannot add a marker
#   Given I click on "Add an Allergy Warning to the Map"
#   And I click "Use My Current Location"
#   And I press "Add My Marker"
#   Then nothing should happen