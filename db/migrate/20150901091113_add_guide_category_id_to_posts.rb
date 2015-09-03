class AddGuideCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :guide_category_id, :integer
  end
end
