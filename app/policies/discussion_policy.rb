DiscussionPolicy = Struct.new(:user, :discussion) do

  def update?
    return false unless user
    user.admin? or discussion.user == user
  end

  def destroy?
    return false unless user
    user.admin?
  end
end
