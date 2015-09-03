class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication, except: [:index, :show]

  # GET /guide
  # GET /guide.json
  def index
    @guide_categories = GuideCategory.all
    @guides = Guide.all
  end

  # GET /guide/1
  # GET /guide/1.json
  def show
    @comment = Comment.new
    @comment.parent = @guide
  end

  # GET /guide/new
  def new
    @guide_categories = GuideCategory.all
    @guide = Guide.new(new_guide_params)
  end

  # GET /guide/1/edit
  def edit
    @guide_categories = GuideCategory.all
  end

  # POST /guide
  # POST /guide.json
  def create
    @guide_categories = GuideCategory.all
    @guide = Guide.new(guide_params)
    @guide.user = current_user

    respond_to do |format|
      if @guide.save
        format.html { redirect_to post_path(@guide), notice: 'Guide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guide }
      else
        format.html { render action: 'new' }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guide/1
  # PATCH/PUT /guide/1.json
  def update
    authorize @guide
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to post_path(@guide), notice: 'guide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guide/1
  # DELETE /guide/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guide
    _url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    def new_guide_params
      if params[:guide]
        {guide_category_id: params[:guide][:guide_category_id]}
      else
        {}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guide_params
      params.require(:guide).permit(
        :guide_category_id,
        :body_markdown,
        :user_id,
        :title,
        :tags_string)
    end
end
