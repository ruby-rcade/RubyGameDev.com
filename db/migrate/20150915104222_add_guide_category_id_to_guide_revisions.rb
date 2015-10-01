class AddGuideCategoryIdToGuideRevisions < ActiveRecord::Migration
  def change
    add_column :guide_revisions, :guide_category_id, :integer
  end
end
