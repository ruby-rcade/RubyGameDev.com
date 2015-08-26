class WeeklyDigestWorker
  include Sidekiq::Worker

  def perform
    
  end
  
  Sidekiq::Cron::Job.create(
  name: "Send Weekly digest email",
  cron: "* * * * 5",
  klass: "")

end