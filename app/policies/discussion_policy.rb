DiscussionPolicy = Struct.new(:user, :discussion) do

  def update?
    user.admin? or discussion.user == user
  end

  def destroy?
    user.admin?
  end
end