class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html do
        @tags = Tag.order('created_at DESC')
      end

      format.json do
        render json: Tag.where('title LIKE ?', params[:term] + "%").map(&:title)
      end
    end
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:title)
    end
end
