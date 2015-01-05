class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.belongs_to :user, index: true
      t.string :provider, index: true
      t.string :uid, index: true
      t.string :token

      t.timestamps
    end

    users = select_all("SELECT id, github_id FROM users")
    users.each do |user|
      Authentication.create!(user_id: user['id'], provider: 'github', uid: user['github_id'])
    end
  end
end
