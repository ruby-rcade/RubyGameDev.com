class CreateForumDiscussions < ActiveRecord::Migration
  def change
    create_table :forum_discussions do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
