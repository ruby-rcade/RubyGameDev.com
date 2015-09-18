class GuideRevisionsController < ApplicationController
  before_action :set_guide_revision, only: [:show, :edit, :approve, :reject]
  before_action :require_login, except: [:index, :show]

  def index
    @guide_revisions = GuideRevision.where(user_id: current_user.id)
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

  #Колона с default value (status -- "pending")


 # alter table schema.guide_revisions alter status set default 'pending'::status_options

  # 1) admin?
  # 2) change guide
  def approve
    @guide_revision.status = 'approved'
    @guide_revision.save!

    redirect_to :back
  end

  def reject
    @guide_revision.status = 'rejected'
    @guide_revision.save!

    redirect_to :back
  end

  def edit
  end

  def set_guide_revision
    @guide_revision = GuideRevision.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(
      :user_id,
      :body_markdown,
      :title,
      :guide_category_id)
  end
end
