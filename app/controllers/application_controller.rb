class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Clearance::Controller
  alias_method :require_authentication, :authorize # to avoid conflict with Pundit's authorize method

  include Pundit # for authorization

  # TODO: enable this once most areas have started using pundit for authorization
  # after_filter :verify_authorized, :except => :index

end
