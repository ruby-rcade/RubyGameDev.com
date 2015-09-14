class GuidesRevisionsController < ApplicationController
  before_action :set_guide_params, only: [:show, :edit]
  before_action :require_login, except: [:index, :show]


def index
  if user.admin?
    @guide_revisions = GuideRevisions.all
  else
    @guide_revisions.user = current_user
  end
end

def edit
end

def show
end

def set_guide_revision
  @guide_revision = GuideRevision.find(params[:id])
end

 def guide_params
  params.require(:guide_revision).permit(
    :original_guide_id,
    :status,
    :body_markdown,
    :user_id,
    :title)
end

end