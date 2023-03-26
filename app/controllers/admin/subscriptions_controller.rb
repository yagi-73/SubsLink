class Admin::SubscriptionsController < ApplicationController
  def new
    @subsc = AdminSubscription.new
  end

  def create
    @subsc = AdminSubscription.new(subsc_params)
    @subsc.save!
    redirect_to subscription_path(@subsc)
  end

  def edit
    @subsc = AdminSubscription.find(params[:id])
  end

  def update
    @subsc = AdminSubscription.find(params[:id])
    @subsc.update(subsc_params)
    redirect_to subscription_path(@subsc)
  end

  def destroy
    subsc = AdminSubscription.find(params[:id])
    subsc.destroy
    redirect_to subscriptions_path
  end

  private
  def subsc_params
    params.require(:admin_subscription).permit(:name,:image, :description, :price, :company_id, :update_cycle)
  end
end
