class AddExternalIdToExternalPosts < ActiveRecord::Migration
  def change
    add_column :external_posts, :external_id, :integer
  end
end
