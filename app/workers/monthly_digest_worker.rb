class MonthlyDigestWorker
  include Sidekiq::Worker

  def perform
    
  end
  
  Sidekiq::Cron::Job.create(
  name: "Send Monthly digest email",
  cron: "* * * * 5",
  klass: "")

end