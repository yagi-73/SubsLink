class Admin::SubscriptionsController < ApplicationController
  def new
    @subsc = AdminSubscription.new
  end

  def index
    @subscriptions = AdminSubscription.with_attached_image.no_overlap
  end

  def create
    @subsc = AdminSubscription.new(subsc_params)
    @subsc.save!
    redirect_to admin_subscriptions_path
  end

  def update
    @subsc = AdminSubscription.find(params[:id])
    @subsc.update(subsc_params)
    redirect_to admin_subscriptions_path
  end

  def destroy
    subsc = AdminSubscription.find(params[:id])
    subsc.destroy
    redirect_to admin_subscriptions_path
  end

  private
  def subsc_params
    params.require(:admin_subscription).permit(:name,:image, :description, :price, :company_id, :update_cycle)
  end
end
