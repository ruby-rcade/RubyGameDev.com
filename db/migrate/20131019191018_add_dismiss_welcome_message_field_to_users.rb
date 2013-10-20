class AddDismissWelcomeMessageFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dismissed_welcome_message, :boolean
  end
end
