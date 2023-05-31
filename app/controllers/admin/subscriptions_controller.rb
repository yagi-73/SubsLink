class Admin::SubscriptionsController < ApplicationController
  def index
    @subsc_new = AdminSubscription.new
    @subscriptions = AdminSubscription.with_attached_image.no_overlap
  end

  def create
    subsc = AdminSubscription.new(subsc_params)
    if subsc.save
      redirect_to admin_subscriptions_path
    else
      @error_obj = subsc
    end
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

  def search
    @subscriptions = AdminSubscription.with_attached_image.search(params[:keyword])
    @subsc_new = AdminSubscription.new
    render :index
  end

  private
  def subsc_params
    params.require(:admin_subscription).permit(:name, :image, :catch_copy, :description, :price, :company_id, :update_cycle)
  end
end
