class WeeklyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_weekly_email
  end

  # FIXME: disable digest emails until the email becomes more useful and doesn't send when there are no updates.
  # Sidekiq::Cron::Job.create(
  #   name: "Send Weekly digest email",
  #   cron: "0 5 * * 6", # send email every saturday at 5:00pm
  #   klass: "WeeklyDigestWorker")
end
