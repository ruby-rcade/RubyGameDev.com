class SessionsController < ApplicationController
  
  # sign in landing page
  def new
    redirect_to account_path if signed_in?
  end

  def create
    auth = request.env['omniauth.auth']
    unless user = User.find_by_github_id(auth['uid'])
      user = User.create_from_auth_hash(auth)
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
