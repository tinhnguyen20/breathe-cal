class User < ActiveRecord::Base
        has_many :cities 

        geocoded_by :address
        after_validation :geocode
end 
