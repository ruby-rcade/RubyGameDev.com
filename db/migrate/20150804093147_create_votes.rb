class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true
    end
  end
end
