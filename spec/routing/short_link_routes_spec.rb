require 'spec_helper'

describe 'Short Link Routes' do

  context 'DEPRECATED' do
    it 'routes discussion links' do
      { get: 'd/1' }.should route_to(controller: 'short_links', action: 'post', id: '1')
    end

    it 'routes tutorial links' do
      { get: 't/1' }.should route_to(controller: 'short_links', action: 'post', id: '1')
    end
  end

  it 'routes post links' do
    { get: '1' }.should route_to(controller: 'short_links', action: 'post', id: '1')
  end

  it 'only routes numeric IDs' do
    { get: '123abc' }.should_not route_to(controller: 'short_links', action: 'post', id: 'abc123')
  end

  context 'when route is not found' do
    it 'routes to the homepage' do
      # { get: 'foobar', host: 'rbga.me' }.should redirect_to root_url
      pending 'Not sure how to implement this'
    end
  end
end
