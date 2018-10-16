class PagesController < ApplicationController
  def home
    @posts = Post.order('created_at desc').page(params[:page])
    @library_categories = LibraryCategory.all
    render layout: 'one_column'
  end
end
