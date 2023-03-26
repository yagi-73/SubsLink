class Public::SubscriptionsController < ApplicationController

  def create
    @subsc = current_user.user_subscriptions.new(subsc_params)
    @subsc.save
    redirect_to subscription_path(@subsc)
  end

  def index
    @subscriptions = AdminSubscription.all
    @subsc = UserSubscription.new
  end

  def show
    @subsc = Subscription.find(params[:id])
    @subsc_new = UserSubscription.new
  end

  def edit
    @subsc = UserSubscription.find(params[:id])
  end

  def update
    @subsc = UserSubscription.find(params[:id])
    @subsc.update(subsc_params)
    redirect_to subscription_path(@subsc)
  end

  def destroy
    subsc = UserSubscription.find(params[:id])
    subsc.destroy
    redirect_to subscriptions_path
  end

  private
  def subsc_params
    params.require(:user_subscription).permit(:name, :price, :contract_day, :update_cycle)
  end
end
