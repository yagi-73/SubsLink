class Public::SubscriptionsController < ApplicationController
  before_action :check_subscription, only: [:edit, :update]

  def create
    @subsc = current_user.user_subscriptions.new(subsc_params)
    @subsc.save
    redirect_to user_path(current_user)
  end

  def subscribe
    current_user.subscribe(params[:id])
    redirect_to user_path(current_user)
  end

  def index
    @subscriptions = AdminSubscription.no_overlap
    @subsc = UserSubscription.new
  end

  def show
    @subsc = Subscription.find(params[:id])
    @subscriptions = AdminSubscription.same_group(@subsc)
    @subsc_new = UserSubscription.new
  end

  def edit
    @subsc = UserSubscription.find(params[:id])
  end

  def update
    @subsc = UserSubscription.find(params[:id])
    @subsc.update(subsc_params)
    redirect_to user_path(current_user)
  end

  def destroy
    subsc = Subscription.find(params[:id])
    current_user.unsubscribe(subsc)
    redirect_to subscriptions_path
  end

  private
  def subsc_params
    params.require(:user_subscription).permit(:name, :price, :contract_day, :update_cycle)
  end

  def check_subscription
    subsc = Subscription.find(params[:id])
    if subsc.class == AdminSubscription
      redirect_to subscription_path(subsc)
    end
  end
end
