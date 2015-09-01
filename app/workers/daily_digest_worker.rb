class DailyDigestWorker
  include Sidekiq::Worker

  def perform
    binding.pry 	
    DigestBuilder.send_daily_email
  end
  
  # Sidekiq::Cron::Job.create(
  # name: "Send daily digest email",
  # cron: "*/1 * * * *",
  # klass: "DailyDigestWorker")

end