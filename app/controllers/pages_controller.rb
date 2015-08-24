class PagesController < ApplicationController
  def home
    @posts = Post.order('created_at desc')
    @library_categories = LibraryCategory.all
    render layout: 'one_column'
  end
end
