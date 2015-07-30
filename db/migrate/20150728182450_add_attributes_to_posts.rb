class AddAttributesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_display_name, :string
    add_column :posts, :source_url, :string
    add_column :posts, :external_id, :integer
  end
end
