class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit # for authorization

  # TODO: enable this once most areas have started using pundit for authorization
  # after_filter :verify_authorized, :except => :index

end
