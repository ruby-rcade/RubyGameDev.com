class GuideCategoriesController < ApplicationController
  before_action :set_guide_category, only: [:show, :edit, :update, :destroy]

  # GET /guide_categories
  # GET /guide_categories.json
  def index
    @guide_categories = GuideCategory.all
  end

  # GET /guide_categories/1
  # GET /guide_categories/1.json
  def show
  end

  # GET /guide_categories/new
  def new
    @guide_category = GuideCategory.new
  end

  # GET /guide_categories/1/edit
  def edit
  end

  # POST /guide_categories
  # POST /guide_categories.json
  def create
    @guide_category = GuideCategory.new(guide_category_params)

    respond_to do |format|
      if @guide_category.save
        format.html { redirect_to @guide_category.current, notice: 'guide category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guide_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @guide_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guide_categories/1
  # PATCH/PUT /guide_categories/1.json
  def update
    respond_to do |format|
      if @guide_category.update(guide_category_params)
        format.html { redirect_to @guide_category, notice: 'guide category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guide_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guide_categories/1
  # DELETE /guide_categories/1.json
  def destroy
    @guide_category.destroy
    respond_to do |format|
      format.html { redirect_to guide_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide_category
      @guide_category = GuideCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guide_category_params
      params.require(:guide_category).permit(:name)
    end
end
