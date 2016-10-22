# # Feature: display a list of added cities
# # 	As an allergy sufferer
# # 	So that I can keep all my allergy information in one place
# # 	I want to be able to sign in/up with an account

# #     Background: 
# #         Given I am  not signed in
       


#     Scenario: Add to favorite in city detail page
#         When I am on the city detail page of ‘Berkeley’
#         Then I should see plus button
#         When I follow plus button
#         Then I should go to sign in page
#         When I finished signed in
#         Then I should see check button
#         And I should not see plus button

#     Scenario: Add to favorite in city list page
#         When I am on the city list page
#         And I have ‘Berkeley’ in my list
#         Then I should see plus button
#         When I follow plus button
#         Then I should go to sign in page
#         When I finished signed in
#         Then I should see check button
#         And I should not see plus button