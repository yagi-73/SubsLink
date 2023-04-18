class Public::UsersController < ApplicationController
  def index
    @users = User.all
    @subsc = UserSubscription.new
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions
    @subsc_calender = make_calender_array(@subscriptions, get_date)
    @subsc = UserSubscription.new
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

  def get_month
    if params[:start_date].present?
      Date.parse(params[:start_date])
    else
      Date.today
    end
  end

  def make_calender_array(subscriptions, date)
    subsc_calender = Array.new
    subscriptions.each do |subsc|
      if subsc.contract_day >= date
        subsc_calender << subsc
      end
      # if subsc.class == AdminSubscription
      #   subsc = Subscription.new(
      #     id: subsc.id,
      #     name: subsc.name,
      #     price: subsc.price,
      #     contract_day: subsc.subscribe_day(current_user),
      #     update_cycle: subsc.update_cycle
      #   )
      # end
      # subsc_next = Subscription.new(
      #   id: subsc.id,
      #   name: subsc.name,
      #   price: subsc.price,
      #   contract_day: subsc.next_update_day
      # )
      # @subsc_calender.push(subsc, subsc_next)
    end
    return subsc_calender
  end
end
