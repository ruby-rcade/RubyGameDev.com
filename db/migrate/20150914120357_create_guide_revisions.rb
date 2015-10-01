class CreateGuideRevisions < ActiveRecord::Migration
  def change
    create_table :guide_revisions do |t|
      t.integer :original_guide_id
      t.string :status

      t.timestamps
    end
  end
end
