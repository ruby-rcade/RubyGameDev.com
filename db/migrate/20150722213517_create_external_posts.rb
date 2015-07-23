class CreateExternalPosts < ActiveRecord::Migration
  def change
    create_table :external_posts do |t|
      t.string :title
    	t.string :user_display_name
    	t.text :body_html
    	t.string :source_url

    	t.timestamps
    end
  end
end
