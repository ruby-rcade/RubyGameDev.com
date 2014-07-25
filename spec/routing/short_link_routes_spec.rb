require 'spec_helper'

describe 'Short Link Routes' do

  it 'routes discussion links' do
    { get: 'd/1' }.should route_to(controller: 'short_links', action: 'discussion', id: '1')
  end

  it 'routes tutorial links' do
    { get: 't/1' }.should route_to(controller: 'short_links', action: 'tutorial', id: '1')
  end

  context 'when route is not found' do
    it 'routes to the homepage' do
      # { get: 'foobar', host: 'rbga.me' }.should redirect_to root_url
      pending 'Not sure how to implement this'
    end
  end
end