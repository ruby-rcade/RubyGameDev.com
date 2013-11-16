class DropForumTables < ActiveRecord::Migration
  def change
    drop_table :forum_topics
    drop_table :forum_discussions
  end
end
