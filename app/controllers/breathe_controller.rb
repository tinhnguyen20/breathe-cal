class BreatheController < ApplicationController
    
    def index
        @cities = session[:cities] || ['berkeley', 'fremont', 'irvine']
    end
    
end
