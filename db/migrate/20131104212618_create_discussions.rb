class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions, force: true do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
