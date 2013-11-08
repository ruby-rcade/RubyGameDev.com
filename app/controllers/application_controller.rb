class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include Pundit # for authorization
  # after_filter :verify_authorized, :except => :index # TODO: enable this once most areas have started using this
  
  helper_method :current_user
  helper_method :signed_in?

  def signed_in?
    session[:user_id].present?
  end

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id]) || User.new
  end

  def require_authentication
    if signed_in?
      true
    else
      redirect_to sign_in_path, notice: 'You must be signed in to perform that action.'
      false
    end
  end

end
