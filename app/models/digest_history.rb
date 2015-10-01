class DigestHistory < ActiveRecord::Base

  def self.create_new!(frequency)
    history = new(frequency: frequency)
    history.users_count = User.count
    history.save!
    history
  end

  def daily_posts
    Post.where('created_at >= ?', 1.day.ago)
  end

  def weekly_posts
    Post.where('created_at >= ?', 1.week.ago)
  end

  def monthly_posts
    Post.where('created_at >= ?', 1.month.ago)
  end
end
