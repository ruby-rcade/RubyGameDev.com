class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :url
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
