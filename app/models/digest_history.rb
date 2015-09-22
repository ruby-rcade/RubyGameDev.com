class DigestHistory < ActiveRecord::Base

  def self.create_new!(frequency)
    history = new(frequency: frequency)
    history.users_count = User.count
    history.save!
    history
  end

  def posts
    Post.all
  end
end
