class AddUserIdToGuideRevisions < ActiveRecord::Migration
  def change
    add_column :guide_revisions, :user_id, :integer
  end
end
