class AddDigestFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :digest_subscriber, :boolean
    add_column :users, :digest_frequency, :string
  end
end
