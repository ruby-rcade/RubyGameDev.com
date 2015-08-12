class GamedevWorker
  include Sidekiq::Worker

  def perform
    response = RubyStackoverflow.questions(
      order: "asc",
      filter: "withbody",
      tagged: "ruby",
      pagesize: 100)
    response.data.each do |question|
      p = ExternalPost.new(
        title: question.title,
        user_display_name: question.owner[:display_name],
        body_html: question.body,
        source_url: question.link,
        external_id: question.question_id)
      p.save
    end
  end

  Sidekiq::Cron::Job.create(
    name: "RubyStackoverflow fetch questions every friday",
    cron: "* * * * 5",
    klass: "GamedevWorker")
end
