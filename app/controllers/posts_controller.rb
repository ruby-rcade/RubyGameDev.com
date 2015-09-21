class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    if params[:search].present?
      @posts = Post.search(params[:search])
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = Comment.new
    @comment.parent = @post

    if request.xhr?
      render partial: 'posts/post_summary'
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = InternalPost.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path(@post), notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: post_path(@post) }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_path(@post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # raise "Sorry, you can't do that" unless current_user.admin?
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

   def vote
    @post = Post.find(params[:id])
    @post.add_vote(current_user)

    if request.xhr?
      render partial: 'votes/vote', locals: {post: @post}
    else
      flash[:notice] = "You have successfully voted"
      redirect_to(:back)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_type
    @type = params[:type] || "InternalPost"
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.

  def post_params
    params.require(post_type.underscore.to_sym).
      permit(:title, :body_markdown, :user_id, :tags_string)
  end
end