class GuideRevisionsController < ApplicationController
  before_action :set_guide_revision, only: [:show, :edit, :update, :approve, :reject]
  before_action :require_login, except: [:index, :show]

  def index
    if current_user.admin?
      @guide_revisions = GuideRevision.all.order("created_at desc")
    else
      @guide_revisions = GuideRevision.where(user_id: current_user.id).order
      ("created_at desc")
    end
 end

  def new
    @guide_categories = GuideCategory.all
    @guide = Guide.find(params[:guide_id])
  end

  def show
  end

  def create
    @guide = Guide.find(params[:guide_id])

    @guide_revision = GuideRevision.new(guide_params)
    @guide_revision.user = current_user
    @guide_revision.original_guide_id = @guide.id
    @guide_revision.save!

    respond_to do |format|
      if @guide_revision.save
        format.html { redirect_to guide_revisions_path(guide_id: @guide.id), notice: 'Your revision was successfully sent for review.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @guide_revision
    respond_to do |format|
      if @guide_revision.update(guide_revision_params)
        format.html { redirect_to guide_revision_path(@guide_revision), notice: 'Your revision was successfully updated.' }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guide_revision.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    @guide = Guide.find_by(@guide_revision.original_guide_id)
    @guide.body_markdown = @guide_revision.body_markdown
    @guide.save!
    @guide_revision.status = 'approved'
    @guide_revision.save!

    redirect_to guide_revisions_path(guide_id: @guide.id)
  end

  def reject
    @guide_revision.status = 'rejected'
    @guide_revision.save!

    redirect_to guide_revisions_path(guide_id: @guide.id)
  end

  def edit
  end

  def set_guide_revision
    @guide_revision = GuideRevision.find(params[:id])
  end

  def guide_revision_params
    params.require(:guide_revision).permit(:title, :body_markdown)
  end

  def guide_params
    params.require(:guide).permit(
      :user_id,
      :body_markdown,
      :title,
      :guide_category_id)
  end
end
