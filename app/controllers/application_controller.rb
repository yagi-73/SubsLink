class ApplicationController < ActionController::Base
  before_action :authenticate_any!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def authenticate_any!
      if request.fullpath.include?("admin")
        authenticate_admin!
      elsif action_name == 'top'
        return
      else
        authenticate_user!
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    end

    def set_subsc_form
      @subsc_new = UserSubscription.new
      @admin_subsc_new = AdminSubscription.new
    end

    def get_top_subscriptions
      @top_subscriptions = AdminSubscription.with_attached_image.top_subscribes
    end

    def get_recommended_user(recommended_users)
      random_following_user = current_user.followings.offset( rand(current_user.followings.count) ).take
      recommended_user = random_following_user.followings.offset( rand(random_following_user.followings.count) ).take
      if recommended_user == current_user || current_user.following?(recommended_user)
        get_recommended_user(recommended_user)
      else
        recommended_users << recommended_user
      end
    end

    def get_recommended_users
      @recommended_users = []
      3.times{ get_recommended_user(@recommended_users) }
      @recommended_users
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

    def get_date
      if params[:start_date].present?
        Date.parse(params[:start_date])
      else
        Date.today
      end
    end

    def diff_month(date1, date2)
      ((date2.year * 12 + date2.month) - (date1.year * 12 + date1.month)).abs
    end

    def make_calender_array(date)
      subsc_calender = Array.new
      @user.subscriptions.each do |subsc|

        if subsc.class == AdminSubscription
          subsc.contract_day = @user.subscribe_day(subsc)
        end
        if subsc.update_this_month?(date)
          subsc.calender_day = subsc.contract_day.months_since(diff_month(date, subsc.contract_day))
          subsc_calender << subsc
        end
      end
      return subsc_calender
    end
end
