class LibraryCategoriesController < ApplicationController
  before_action :set_library_category, only: [:show, :edit, :update, :destroy]

  # GET /library_categories
  # GET /library_categories.json
  def index
    @library_categories = LibraryCategory.all
  end

  # GET /library_categories/1
  # GET /library_categories/1.json
  def show
  end

  # GET /library_categories/new
  def new
    @library_category = LibraryCategory.new
  end

  # GET /library_categories/1/edit
  def edit
  end

  # POST /library_categories
  # POST /library_categories.json
  def create
    @library_category = LibraryCategory.new(library_category_params)
    respond_to do |format|
      if @library_category.save
        format.html { redirect_to @library_category, notice: 'Library category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @library_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @library_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library_categories/1
  # PATCH/PUT /library_categories/1.json
  def update
    respond_to do |format|
      if @library_category.update(library_category_params)
        format.html { redirect_to @library_category, notice: 'Library category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @library_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library_categories/1
  # DELETE /library_categories/1.json
  def destroy
    @library_category.destroy
    respond_to do |format|
      format.html { redirect_to library_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_category
      @library_category = LibraryCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def library_category_params
      params.require(:library_category).permit(:title)
    end
end
