require "application_responder"

# Rails main application controller
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::RedirectBackError, with: :redirect_to_root

  private
    def redirect_to_root
      redirect_to root_path
    end

end
