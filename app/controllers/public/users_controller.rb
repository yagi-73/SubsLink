class Public::UsersController < ApplicationController
  def index
    @mutually_following_users = current_user.mutually_followings
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions
    @subsc_calender = make_calender_array(get_date)
    @recommend = @user.not_subscribing.order("RANDOM()").first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name)
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
        subsc.contract_day = subsc.subscribe_day(@user)
      end
      if subsc.update_this_month?(date)
        subsc.calender_day = subsc.contract_day.months_since(diff_month(date, subsc.contract_day))
        subsc_calender << subsc
      end
    end
    return subsc_calender
  end
end
