class PagesController < ApplicationController
  def home
    @tutorials = Tutorial.all.limit(10)
  end
end
