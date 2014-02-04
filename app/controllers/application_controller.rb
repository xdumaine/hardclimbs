class ApplicationController < ActionController::Base
  add_breadcrumb "Home", :root_path
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  # https://github.com/ryanb/cancan/issues/835 - Remove this once CanCan gets fixed
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  def routing_error
      render "pages/404", :status => 404
  end
  
end