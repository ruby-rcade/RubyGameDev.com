class DailyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_daily_email
  end

  # FIXME: disable digest emails until the email becomes more useful and doesn't send when there are no updates.
  # Sidekiq::Cron::Job.create(
  #   name: "Send daily digest email",
  #   cron: "10 17 * * *", # send email everyday at 5:10pm
  #   klass: "DailyDigestWorker")
end
