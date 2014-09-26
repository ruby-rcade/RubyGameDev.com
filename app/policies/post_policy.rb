PostPolicy = Struct.new(:user, :post) do

  def update?
    user.admin? or post.user == user
  end

  def destroy?
    user.admin?
  end
end
