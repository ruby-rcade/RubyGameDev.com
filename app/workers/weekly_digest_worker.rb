class WeeklyDigestWorker
  include Sidekiq::Worker

  def perform
    DigestBuilder.send_weekly_email
  end
  
  # send email every saturday at 5:00pm
  Sidekiq::Cron::Job.create(
  name: "Send Weekly digest email",
  cron: "0 5 * * 6",
  klass: "WeeklyDigestWorker")

end