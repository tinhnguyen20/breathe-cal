require 'rails_helper'

describe 'Client' do
    
    describe 'when working with a valid client' do
        before :each do 
            @valid_client = Client.new(name: 'Joseph Brodsky', provider: 'google_oauth2', oauth_token: 'some_token', oauth_expires_at: 'July 1 2017')
        end
        
        it 'has a provider' do
            expect(@valid_client.provider).to eq 'google_oauth2'
        end
        
        it 'has an authentication token' do
            expect(@valid_client.oauth_token).to eq 'some_token'
        end
        
        it 'has an authentication expiration date' do
            expect(@valid_client.oauth_expires_at).to eq 'July 1 2017'
        end
        
        it 'passes the validity check' do
            expect(@valid_client.valid?).to be_truthy
        end
    end
    
    describe 'when working with a valid client' do
        before :each do 
            @invalid_client = Client.new(name: 'Ivan Drago', email: 'beatrocky@gmail.com')
        end
        
        it 'does not have a provider' do
            expect(@invalid_client.provider).to be_nil
        end
        
        it 'does not have an authentication token' do
            expect(@invalid_client.oauth_token).to be_nil
        end
        
        it 'does not have an authentication expiration date' do
            expect(@invalid_client.oauth_expires_at).to be_nil
        end
        
        it 'does not pass the validity check' do
            expect(@invalid_client.valid?).to be_falsy
        end
    end
    
    describe '#from_omniauth' do
        describe 'when proper credentials are passed to the method' do
            before :each do
                @proper_user_credentials = {provider:'google_oauth2', credentials: {token: 'some token', expires_at: Time.new(2017, 10, 31)}, info: {name: 'James Bond'}, email: 'jamesbond@gmail.com'}
            end
            
            it 'calling the method creates a Client' do
                client = Client.from_omniauth(@proper_user_credentials)
                expect(client).to be_an_instance_of Client
            end
            
            describe 'after the method has been called' do
                before :each do
                    @client = Client.from_omniauth(@proper_user_credentials)
                end
                
                it 'has a provider' do
                    expect(@client.provider).to eq 'google_oauth2'
                end
                
                it 'has an authentication token' do
                    expect(@client.oauth_token).to eq 'some token'
                end
                
                it 'has an authentication expiration date' do
                    expect(@client.oauth_expires_at).to eq Time.new(2017, 10, 31)
                end
                
                it 'passes the validity check' do
                    expect(@client.valid?).to be_truthy
                end
            end
        end 
        
        describe 'when unproper user credentials are passed to the method' do
            before :each do
                @unproper_user_credentials = {name: "Ivan Drago", email: 'ibeatrocky@gmail.com'}
            end
            
            it 'calling the method with unproper user credentials raises an error' do
                expect(lambda { Client.from_omniauth(@unproper_user_credentials) }).to raise_error(NameError)
            end
        end
    end 
    
    
end