class ClientsController < ApplicationController
    def show
        @client = Client.find_by(name: 'client1')
        
        redirect_to controller: 'breathe', action: 'index', searches: @client.searches
    end
    
    def addToClient
        puts "COOOOOOL"
    end
    
    def index
    end
end
