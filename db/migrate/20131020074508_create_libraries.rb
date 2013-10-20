class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :name
      t.text :description
      t.string :website_url
      t.references :category, index: true

      t.timestamps
    end
  end
end
