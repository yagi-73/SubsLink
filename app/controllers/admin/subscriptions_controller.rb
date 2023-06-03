class Admin::SubscriptionsController < ApplicationController
  def index
    @subsc = AdminSubscription.new
    @subscriptions = AdminSubscription.with_attached_image.where(is_basic: true)
  end

  def create
    @subsc = AdminSubscription.new(subsc_params)
    @subsc.is_basic = params[:basic_subscription_id].nil?
    if @subsc.save
      redirect_to admin_subscriptions_path
    else
      @subscriptions = AdminSubscription.with_attached_image.where(is_basic: true)
      render :index
    end
  end

  def show
    @subsc = AdminSubscription.find(params[:id])
    @subscriptions = @subsc.is_basic ? @subsc.extension_subscriptions : AdminSubscription.related_subscriptions(@subsc)
  end

  def update
    @subsc = AdminSubscription.find(params[:id])
    @subsc.is_basic = params[:basic_subscription_id].nil?
    if @subsc.update(subsc_params)
      redirect_to admin_subscriptions_path
    else
      @subscriptions = AdminSubscription.with_attached_image.where(is_basic: true)
      render :index
    end
  end

  def destroy
    subsc = AdminSubscription.find(params[:id])
    subsc.destroy
    redirect_to admin_subscriptions_path
  end

  def search
    @subscriptions = AdminSubscription.with_attached_image.search(params[:keyword])
    @subsc = AdminSubscription.new
    render :index
  end

  def change_form
    @subscriptions = AdminSubscription.where(company_id: params[:company_id], is_basic: true)
  end

  private
  def subsc_params
    params.require(:admin_subscription).permit(:name, :image, :catch_copy, :description, :price, :company_id, :basic_subscription_id, :update_cycle)
  end
end
