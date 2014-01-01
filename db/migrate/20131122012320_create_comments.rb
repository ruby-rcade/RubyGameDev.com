class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, index: true
      t.references :parent, polymorphic: true

      t.timestamps
    end
  end
end
