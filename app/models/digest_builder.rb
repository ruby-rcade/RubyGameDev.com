class DigestBuilder

  def self.send_daily_email
    history = DigestHistory.where(frequency: 'daily').last || DigestHistory.create_new!('daily')
    User.subscriber_daily_digest.each do |user|
      DigestMailer.daily_digest(history, user.id).deliver!
    end
    DigestHistory.create_new!('daily')
  end

  def self.send_weekly_email
    history = DigestHistory.where(frequency: 'weekly').last || DigestHistory.create_new!('weekly')
    User.subscriber_weekly_digest.each do |user|
      DigestMailer.weekly_digest(history, user.id).deliver!
    end
    DigestHistory.create_new!('weekly')
  end

  def self.send_monthly_email
    history = DigestHistory.where(frequency: 'monthly').last || DigestHistory.create_new!('monthly')
    User.subscriber_monthly_digest.each do |user|
      DigestMailer.monthly_digest(history, user.id).deliver!
    end
    DigestHistory.create_new!('monthly')
  end
end