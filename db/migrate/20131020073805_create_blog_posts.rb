class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :body_markdown
      t.text :body_html
      t.boolean :draft
      t.date :published_on
      t.references :user, index: true

      t.timestamps
    end
  end
end
