class SessionsController < ApplicationController
    def create 
        client = Client.from_omniauth(env["omniauth.auth"])
        session[:client_id] = client.id
        redirect_to root_path
    end
    
    def destroy
        session[:client_id] = nil
        redirect_to root_path
    end
end
