class DigestBuilder

  def self.send_daily_email
    history = DigestHistory.where(frequency: 'daily').last || DigestHistory.create_new!('daily')
    User.subscriber_daily_digest.each do |user|
      DigestMailer.daily_digest(history, user.id).deliver!
    end
    DigestHistory.create_new!('daily')
  end

end