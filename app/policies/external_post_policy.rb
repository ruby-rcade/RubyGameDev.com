ExternalPostPolicy = Struct.new(:user, :post) do
  def update?
    false
  end

  def destroy?
    return false unless user
    user.admin?
  end
end
