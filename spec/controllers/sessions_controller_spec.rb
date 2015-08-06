require 'rails_helper'

describe SessionsController do
  describe '#auth_failure' do
    it 'redirects to the homepage' do
      get :auth_failure, message: 'invalid_credentials', origin: 'http://www.rubygamedev.com/sign_in', strategy: 'github'
      expect(response).to redirect_to root_path
      expect(flash[:alert]).to eq 'invalid_credentials'
    end
  end
end
