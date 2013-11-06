class DigestHistory < ActiveRecord::Base

  def self.create_new!
    history = new
    history.last_discussion_id = Discussion.last.id
    history.last_tutorial_id = Tutorial.last.id
    history.last_library_id = Library.last.id
    history.users_count = User.count
    history.save!
  end

  def discussions
    Discussion.where('id > ?', last_discussion_id)
  end

  def tutorials
    Tutorial.where('id > ?', last_discussion_id)
  end

  def libraries
    Tutorial.where('id > ?', last_discussion_id)
  end

end
