class User < ActiveRecord::Base
  def username
    if guest
      "Guest#{id}"
    end
  end
end
