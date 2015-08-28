class WeeklyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_weekly_email
  end
  
  Sidekiq::Cron::Job.create(
  name: "Send Weekly digest email",
  cron: "*/15 * * * *",
  klass: "WeeklyDigestWorker")

end