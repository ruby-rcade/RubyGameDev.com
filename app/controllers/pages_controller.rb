class PagesController < ApplicationController
  def home
    @discussions = Discussion.all.limit(10)
    @tutorials = Tutorial.all.limit(10)
    @questions = Question.all[0..4]
    @library_categories = LibraryCategory.all
  end

  def about
    
  end
end
