class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  include Clearance::Controller
  alias_method :require_authentication, :authorize # to avoid conflict with Pundit's authorize method

  include Pundit # for authorization

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # TODO: enable this once most areas have started using pundit for authorization
  # after_filter :verify_authorized, :except => :index

end
