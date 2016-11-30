require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    
    # before :each do
    #     @current_client = Factory :client_id
    # end
    # before { controller.instance_variable_set(:@authauth, nil) } 

    describe "POST create" do
        context "test check is true" do
            it "create" do
                post :create, test_check: '1'
            end
        end
        context "text check is false" do 
            it "create something else" do
            end
        end
    end

    describe "#destroy" do
        it "delete the current client" do
            delete :destroy
            response.should redirect_to root_path
        end
    end
    
    describe "#checklogged" do 
        context "session client_id is not nil" do 
            it "check log" do
                request.session[:client_id] = "12334"
                get :checklogged
            end
        end
        context "session client_id is nil" do 
            it "check log" do
                get :checklogged
            end
        end
    end

  
end
