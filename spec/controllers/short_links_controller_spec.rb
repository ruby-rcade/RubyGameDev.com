require 'spec_helper'

describe ShortLinksController do

  describe 'GET #post' do
    it 'redirects to the full post URL' do
      get :post, id: '123abc'
      response.should redirect_to post_url(host: 'rubygamedev.com')
    end
  end

end
