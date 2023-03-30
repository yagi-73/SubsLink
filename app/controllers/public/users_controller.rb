class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    subscriptions = @user.subscriptions
    @subscriptions = Array.new
    subscriptions.each do |subsc|
      subsc_next = UserSubscription.new(
          id: subsc.id,
          name: subsc.name,
          contract_day: subsc.next_update_day
        )
      @subscriptions.push(subsc, subsc_next)
    end
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
end
