class SessionsController < ApplicationController
    def create 
        auth = request.env["omniauth.auth"]
        session[:omniauth] = auth.except("extra")
        person = Person.sign_in_from_omniauth(auth)
        session[:person_id] = person.id
        redirect_to root_url, :notice => "SIGNED IN"
    end
    
    def destroy
        session[:person_id] = nil
        session[:omniauth] = nil
        redirect_to root_url, :notice => "SIGNED OUT"
    end
end
