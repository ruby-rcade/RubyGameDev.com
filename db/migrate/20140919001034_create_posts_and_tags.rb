class CreatePostsAndTags < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body_markdown
      t.text :body_html
      t.belongs_to :user, index: true

      t.timestamps
    end

    create_table :tags do |t|
      t.string :title
      t.boolean :approved
      t.belongs_to :user, index: true

      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.belongs_to :post
      t.belongs_to :tag
    end
  end
end
