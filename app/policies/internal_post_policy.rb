InternalPostPolicy = Struct.new(:user, :internal_post) do
  def update?
    return false unless user
    user.admin? or internal_post.user == user
  end

  def destroy?
    return false unless user
    user.admin?
  end
end
