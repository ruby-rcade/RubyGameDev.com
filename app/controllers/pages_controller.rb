class PagesController < ApplicationController
  def home
    @posts = Post.order('created_at desc')
    @questions = Question.all[0..4]
    @library_categories = LibraryCategory.all
    render layout: 'one_column'
  end
end
