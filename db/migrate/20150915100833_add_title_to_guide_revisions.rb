class AddTitleToGuideRevisions < ActiveRecord::Migration
  def change
    add_column :guide_revisions, :title, :string
  end
end
