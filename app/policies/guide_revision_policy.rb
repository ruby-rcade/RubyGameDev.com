GuideRevisionPolicy = Struct.new(:user, :post) do
  def update?
    return false unless user
    user.admin? || post.user == user
  end

  alias_method :view_status?, :update?

  def change_status?
    return false unless user
    user.admin?
  end

  def destroy?
    return false unless user
    user.admin?
  end
end