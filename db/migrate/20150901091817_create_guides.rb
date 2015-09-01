class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|

      t.timestamps
    end
  end
end
