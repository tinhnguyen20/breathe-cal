class SessionsController < ApplicationController
    # after_filter:database_cleanup
    
    def create 
        test_check = params[:test_check]
        if test_check
            client = Client.new()
            client.name = params[:name]
            client.save!
        else
            client = Client.from_omniauth(env["omniauth.auth"])
        end 
        session[:client_id] = client.id
        redirect_to root_path
    end
    
    def destroy
        session[:client_id] = nil
        redirect_to root_path
    end
    
end
