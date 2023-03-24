class Public::SubscriptionsController < ApplicationController

  def create
    @subsc = current_user.subscriptions.new(subsc_params)
    @subsc.save
    redirect_to subscription_path(@subsc)
  end

  def index
    @subscriptions = AdminSubscription.all
    @subsc = Subscription.new
  end

  def show
    @subsc = Subscription.find(params[:id])
    @subsc_new = Subscription.new
  end

  def edit
    @subsc = Subscription.find(params[:id])
  end

  def update
    @subsc = Subscription.find(params[:id])
    @subsc.update(subsc_params)
    redirect_to subscription_path(@subsc)
  end

  def destroy
    subsc = Subscription.find(params[:id])
    subsc.destroy
    redirect_to subscriptions_path
  end

  private
  def subsc_params
    params.require(:subscription).permit(:name, :price, :start_time, :update_cycle)
  end
end
