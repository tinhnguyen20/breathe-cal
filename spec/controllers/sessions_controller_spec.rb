require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    describe "POST create" do
        
    end
    
    describe "DELETE #destroy" do
        it "delete the current client" do
        response.should redirect_to root_path
        end
    end

  
end
