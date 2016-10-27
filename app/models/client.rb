class Client < ActiveRecord::Base
    serialize :searches, JSON
end
