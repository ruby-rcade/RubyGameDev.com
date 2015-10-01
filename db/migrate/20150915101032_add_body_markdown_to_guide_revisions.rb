class AddBodyMarkdownToGuideRevisions < ActiveRecord::Migration
  def change
    add_column :guide_revisions, :body_markdown, :text
  end
end
