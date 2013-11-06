class DigestHistory < ActiveRecord::Base

  def self.create_new!
    history = new
    # history.last_discussion_id = Forum::Discussion.last.id
    history.last_tutorial_id = Tutorial.last.id
    history.last_library_id = Library.last.id
    history.user_count = User.count
    history.save!
  end

end
