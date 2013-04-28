class ApplicationController < ActionController::Base
  add_breadcrumb "Home", :root_path
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end