class FixVotesTable < ActiveRecord::Migration
  def change
    drop_table :votes

    create_table :votes do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
