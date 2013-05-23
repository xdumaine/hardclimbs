class ApplicationController < ActionController::Base
  add_breadcrumb "Home", :root_path
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActionController::UnknownController,
                ActionController::UnknownAction,
                ActionController::MethodNotAllowed do |exception|
      routing_error
    end
  end
      
  def routing_error
      render "pages/404", :status => 404
  end
  
end