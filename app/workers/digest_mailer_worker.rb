class DigestMailerWorker
  include Sidekiq::Worker

  def perform
    
  end
  
  Sidekiq::Cron::Job.create(
  name: "Send digest email",
  cron: "* * * * 5",
  klass: "GamedevWorker")

end