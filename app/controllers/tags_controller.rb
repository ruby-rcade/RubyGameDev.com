class TagsController < ApplicationController
  def index
    respond_to do |format|
      format.html do 
        @tags = Tag.order('created_at desc')
      end

      format.json do
        render json: Tag.where('title LIKE ?', params[:term] + "%").map(&:title)
      end
    end
  end

  def show
    @tags = Tag.find(params[:id])
    @posts = @tag.posts
  end
end
