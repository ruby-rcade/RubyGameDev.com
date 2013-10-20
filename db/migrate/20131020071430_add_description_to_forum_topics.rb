class AddDescriptionToForumTopics < ActiveRecord::Migration
  def change
    add_column :forum_topics, :description, :string
  end
end
