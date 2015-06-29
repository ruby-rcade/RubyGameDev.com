require 'rails_helper'

RSpec.describe ShortLinksController, type: :controller do

  describe 'GET #post' do
    it 'redirects to the full post URL' do
      get :post, id: '47'
      expect(response).to redirect_to post_url('47', host: 'www.rubygamedev.com')
    end
  end

end
