class DailyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_daily_email
  end
  
  # send email everyday at 5:10pm
  Sidekiq::Cron::Job.create(
    name: "Send daily digest email",
    cron: "10 17 * * *",
    klass: "DailyDigestWorker")
end