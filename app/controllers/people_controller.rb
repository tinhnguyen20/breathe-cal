class PeopleController < ApplicationController
    before_filter :set_auth
    
    def index
    end
    
    def set_auth
        @auth = session[:omniauth] if session[:omniauth]
    end
end

