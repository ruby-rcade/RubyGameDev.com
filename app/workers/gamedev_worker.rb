class GamedevWorker
  include Sidekiq::Worker
  def perform
    fetch_questions.each do |question|
      create_post(question)
    end
  end

  def fetch_questions
    response = RubyStackoverflow.questions(
      order: "asc",
      filter: "withbody",
      tagged: "ruby",
      pagesize: 100)
    response.data
  end

  def create_post(question)
    ExternalPost.create(
      title: question.title,
      user_display_name: question.owner[:display_name],
      body_html: question.body,
      source_url: question.link,
      external_id: question.question_id,
      tags_string: 'question')
  end

  Sidekiq::Cron::Job.create(
    name: "RubyStackoverflow fetch questions every friday",
    cron: "* * * * 5",
    klass: "GamedevWorker")

end