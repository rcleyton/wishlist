require 'rails_helper'

describe 'Create user', type: :request do
  context 'post' do
    it "successfull" do
      post "/api/v1/users", 
      params:
        {
          name: "John Doe",
          email: "john@doe.com",
          password: "12345678",
          password_confirmation: "12345678"
        } 
        
      byebug
      expect(response).to have_http_status(:created)

    end
  end
end