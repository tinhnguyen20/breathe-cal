Feature: Weather and Allergen Forecast
    As an allergy sufferer
    In order to know what type of preventions to take for the current day
    I need to retrieve data from accuweather using the city data that was searched
    
    Background: 
        Given I am on the site
        And I got the city name "Berkeley"

    Scenario: 
        Then div "Allergen Info" should not be empty
        And div "Air Quality" should not be empty    
        
        
        ## self todo:
        # figaro for API key / application.yml etc. 
        # make some API requests.. shouldnt be too bad....
        # get the responses -> bing bang boom... ? 
        # should the api request be done via javascript?
        
        #
        
        
        
        #what do i want done
        # what these tests say