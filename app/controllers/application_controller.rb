class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number, :ville_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :ville_id])
    end

    private

    def render_404
      respond_to do |format|
        format.html { render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found }
        format.all { render plain: "404 Not Found", status: :not_found }
    end
    
    end
end
