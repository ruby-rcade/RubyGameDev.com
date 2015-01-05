PostPolicy = Struct.new(:user, :post) do

  def update?
    return false unless user
    user.admin? or post.user == user
  end

  def destroy?
    return false unless user
    user.admin?
  end
end
