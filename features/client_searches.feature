# Feature: client searches 
#   As an allergy sufferer with a user account
#   in order to know what cities I have recently searched for, 
#   I should see the last 5 cities I searched for at the bottom of the sidebar on the landing page.
   
# Background: 
#     Given the following clients exist:
#       | name        |email               | searches |
#       | client1     |dork@gmail.com      |          |
     
#     # And I am logged in as "client1"
   
# Scenario: I should see a blank search history before having searched for anything
#     Given I am on the landing page
#     Then I should see "Recent Searches"
#     Then I should see an empty search history
  
# Scenario: Having searched for a city I should see it displayed on the page
#     Given I as "client1" have searched for "Berkeley"
#     And I am on the landing page
#     Then I should see "Berkeley"
#     And I should not see "Vancouver"
#     And I should not see "Boston"

# Scenario: Having searched for two cities I should see the most recent one on top
#     Given I as "client1" have searched for "Berkeley"
#     And I as "client1" have searched for "Albany"
#     And I am on the landing page
#     Then I should see "Berkeley"
#     And I should see "Albany"
#     And I should see "Berkeley" below "Albany"    
      
# Scenario: Having searched for more than 5 cities I should only see the last 5 ones displayed
#     Given I as "client1" have searched for "Berkeley"
#     And I as "client1" have searched for "Albany"
#     And I as "client1" have searched for "Oakland"
#     And I as "client1" have searched for "Richmond"
#     And I as "client1" have searched for "San Francisco"
#     And I as "client1" have searched for "San Jose"
#     And I am on the landing page
#     Then I should see "San Jose"
#     And I should see "San Francisco"
#     And I should see "Richmond"
#     And I should see "Oakland"
#     And I should see "Albany"
#     And I should not see "Berkeley"

 
# @javascript
# Scenario: Verifying that information is displayed on Map Page 
#     Given I am on the landing page
#     And my location is set to "Berkeley"
#     Then I should see "Low" next to "Grass"
#     Then I should see "Low" next to "Mold"
#     Then I should see "Moderate" next to "UVIndex"
