class Public::UsersController < ApplicationController
  def index
    @users = User.all
    @subsc = UserSubscription.new
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions
    make_calender_array(@subscriptions)
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

  def make_calender_array(subscriptions)
    @subsc_calender = Array.new
    subscriptions.each do |subsc|
      if subsc.class == AdminSubscription
        subsc = Subscription.new(
          id: subsc.id,
          name: subsc.name,
          contract_day: subsc.subscribe_day(@user),
          update_cycle: subsc.update_cycle
        )
      end
      subsc_next = Subscription.new(
        id: subsc.id,
        name: subsc.name,
        contract_day: subsc.next_update_day
      )
      @subsc_calender.push(subsc, subsc_next)
    end
  end
end
