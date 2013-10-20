class Question
  def self.all
        json = File.read(Rails.root.join('questions.json'))
    @questions = JSON.parse(json)['items']
    end
    end