class MonthlyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_monthly_email
  end
  
  # send email every first day in the month
  Sidekiq::Cron::Job.create(
  name: "Send Monthly digest email",
  # cron: "0 0 1 * *",
  cron: "20 17 * * *",
  klass: "MonthlyDigestWorker")

end