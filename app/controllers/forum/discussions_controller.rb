class Forum::DiscussionsController < ApplicationController
  before_action :set_forum_topic, only: [:index, :new, :create]
  before_action :set_forum_discussion, only: [:show, :edit, :update, :destroy]

  # GET /forum/discussions
  # GET /forum/discussions.json
  def index
    @discussions = @topic.discussions.all
  end

  # GET /forum/discussions/1
  # GET /forum/discussions/1.json
  def show
  end

  # GET /forum/discussions/new
  def new
    @discussion = @topic.discussions.new
  end

  # GET /forum/discussions/1/edit
  def edit
  end

  # POST /forum/discussions
  # POST /forum/discussions.json
  def create
    @discussion = @topic.discussions.new(forum_discussion_params)
    @discussion.user = @user

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discussion }
      else
        format.html { render action: 'new' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum/discussions/1
  # PATCH/PUT /forum/discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(forum_discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum/discussions/1
  # DELETE /forum/discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to forum_discussions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_discussion
      @discussion = Forum::Discussion.find(params[:id])
    end

    def set_forum_topic
      @topic = Forum::Topic.find(params[:topic_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_discussion_params
      params.require(:forum_discussion).permit(:title, :body, :user_id, :topic_id)
    end
end
