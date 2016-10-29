class Client < ActiveRecord::Base
    serialize :searches, JSON
    
    def self.addToClient(name, city)
        client = Client.find_by_name(name)
        client.searches = [city]
    end 
end
