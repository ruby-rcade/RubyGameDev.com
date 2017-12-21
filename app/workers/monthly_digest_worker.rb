class MonthlyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_monthly_email
  end

  # FIXME: disable digest emails until the email becomes more useful and doesn't send when there are no updates.
  # Sidekiq::Cron::Job.create(
  #   name: "Send Monthly digest email",
  #   cron: "0 0 1 * *", # send email every first day in the month
  #   klass: "MonthlyDigestWorker")
end
