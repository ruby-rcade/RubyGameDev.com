class CreateDigestHistories < ActiveRecord::Migration
  def change
    create_table :digest_histories do |t|
      t.string :frequency
      t.integer :last_discussion_id
      t.integer :last_tutorial_id
      t.integer :last_library_id
      t.integer :users_count

      t.timestamps
    end
  end
end
