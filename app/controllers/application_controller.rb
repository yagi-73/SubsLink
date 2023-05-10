class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_subsc_form
  before_action :get_top_subscriptions

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end

    def set_subsc_form
      @subsc_new = UserSubscription.new
      @admin_subsc_new = AdminSubscription.new
    end

    def get_top_subscriptions
      @top_subscriptions = AdminSubscription.includes(:subscribes, {image_attachment: :blob}).top_subscribes
    end

    def after_sign_in_path_for(resource)
      case resource
      when Admin
        admin_subscriptions_path
      when User
        user_path(resource)
      end
    end

    def after_sign_out_path_for(resource)
      case resource
      when :admin
        new_admin_session_path
      when :user
        new_user_session_path
      end
    end
end
