class MonthlyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_monthly_email
  end
  
  Sidekiq::Cron::Job.create(
  name: "Send Monthly digest email",
  cron: "*/15 * * * *",
  klass: "MonthlyDigestWorker")

end