class Forum::TopicsController < ApplicationController
  before_action :set_forum_topic, only: [:show, :edit, :update, :destroy]
  before_action :check_if_user_is_allowed, only: [:edit, :update, :destroy]

  # GET /forum/topics
  # GET /forum/topics.json
  def index
    @forum_topics = Forum::Topic.all
  end

  # GET /forum/topics/1
  # GET /forum/topics/1.json
  def show
  end

  # GET /forum/topics/new
  def new
    @forum_topic = Forum::Topic.new
  end

  # GET /forum/topics/1/edit
  def edit
  end

  # POST /forum/topics
  # POST /forum/topics.json
  def create
    @forum_topic = Forum::Topic.new(forum_topic_params)

    respond_to do |format|
      if @forum_topic.save
        format.html { redirect_to @forum_topic, notice: 'Topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forum_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @forum_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum/topics/1
  # PATCH/PUT /forum/topics/1.json
  def update
    respond_to do |format|
      if @forum_topic.update(forum_topic_params)
        format.html { redirect_to @forum_topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forum_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum/topics/1
  # DELETE /forum/topics/1.json
  def destroy
    @forum_topic.destroy
    respond_to do |format|
      format.html { redirect_to forum_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_topic
      @forum_topic = Forum::Topic.find(params[:id])
    end

    def check_if_user_is_allowed
      return true if @user.is_admin?
      if @forum_topic.user_id != @user.id
        render text: "Sorry, you're not allowed to perform that action.", status: 401
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_topic_params
      params.require(:forum_topic).permit(:title)
    end
end
