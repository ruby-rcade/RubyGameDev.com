class CreateGuideCategories < ActiveRecord::Migration
  def change
    create_table :guide_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
