class ShortLinksController < ApplicationController
  def discussion
    # TODO: add logging for analytics
    redirect_to discussion_url(params[:id]), status: :moved_permanently
  end

  def tutorial
    # TODO: add logging for analytics
    redirect_to tutorial_url(params[:id]), status: :moved_permanently
  end
end
