class PagesController < ApplicationController
  def home
    @forum_topics = Forum::Topic.all.limit(10)
    @tutorials = Tutorial.all.limit(10)
    @questions = Question.all[0..4]
    @library_categories = LibraryCategory.all
  end
end
