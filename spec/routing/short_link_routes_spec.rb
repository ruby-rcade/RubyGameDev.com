require "rails_helper"

describe 'Short Link Routes' do

  it 'routes post links' do
    expect(get: '1').to route_to(controller: 'short_links', action: 'post', id: '1')
  end

  it 'only routes numeric IDs' do
    expect(get: '123abc').to_not be_routable
  end

  # TODO: Not sure how to implement this
  # context 'when route is not found' do
  #   it 'routes to the homepage' do
  #     # { get: 'foobar', host: 'rbga.me' }.should redirect_to root_url
  #     pending 'Not sure how to implement this'
  #   end
  # end
end
