class Public::SubscriptionsController < ApplicationController
  before_action :check_subscription, only: [:edit, :update]

  def create
    @subsc = current_user.user_subscriptions.new(user_subsc_params)
    @subsc.save
    redirect_to user_path(current_user)
  end

  def subscribe
    current_user.subscribe(admin_subsc_params)
    redirect_to user_path(current_user)
  end

  def index
    if params[:category].nil?
      @subscriptions = AdminSubscription.with_attached_image.no_overlap
    else
      @subscriptions = Category.find_by(name: params[:category]).admin_subscriptions.with_attached_image.no_overlap
    end
    @categories = Category.all
  end

  def search
    @subscriptions = AdminSubscription.with_attached_image.search(params[:keyword])
    render :index
  end

  def show
    @subsc = Subscription.find(params[:id])
    @subscriptions = AdminSubscription.same_group(@subsc)
    @admin_subsc_new = AdminSubscription.new
  end

  def edit
    @subsc = UserSubscription.find(params[:id])
  end

  def update
    @subsc = UserSubscription.find(params[:id])
    @subsc.update(user_subsc_params)
    redirect_to user_path(current_user)
  end

  def destroy
    subsc = Subscription.find(params[:id])
    current_user.unsubscribe(subsc)
    redirect_to user_path(current_user)
  end

  private
  def user_subsc_params
    params.require(:user_subscription).permit(:name, :price, :contract_day, :update_cycle)
  end

  def admin_subsc_params
    params.require(:admin_subscription).permit(:admin_subscription_id, :contract_day)
  end

  def check_subscription
    subsc = Subscription.find(params[:id])
    if subsc.class == AdminSubscription
      redirect_to subscription_path(subsc)
    end
  end
end
