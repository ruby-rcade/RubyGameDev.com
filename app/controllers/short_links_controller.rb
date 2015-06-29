class ShortLinksController < ApplicationController
  def post
    # TODO: add logging for analytics
    redirect_to post_url(params[:id], host: 'www.rubygamedev.com'), status: :moved_permanently
  end
end
