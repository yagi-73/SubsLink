class Public::SubscriptionsController < ApplicationController
  before_action :check_subscription, only: [ :update, :destroy]
  before_action :set_subsc_form, omly: [ :index, :show, :search]
  before_action :get_top_subscriptions, omly: [ :index, :show, :search]
  before_action :get_recommended_users, only: [ :index, :show, :search]

  def create
    subsc = current_user.user_subscriptions.new(user_subsc_params)
    if subsc.save
      redirect_to user_path(current_user)
    else
      @error_obj = subsc
      @user = current_user
      @subsc_calender = make_calender_array(get_date)
      render "public/users/show"
    end
  end

  def subscribe
    current_user.subscribe(admin_subsc_params)
    redirect_to user_path(current_user)
  end

  def index
    if params[:category].nil?
      @subscriptions = AdminSubscription.where(is_basic: true).with_attached_image
    else
      @subscriptions = Category.find_by(name: params[:category]).admin_subscriptions.where(is_basic: true).with_attached_image
    end
    @categories = Category.all
  end

  def show
    @subsc = Subscription.find(params[:id])
    @subscriptions = @subsc.is_basic ? @subsc.extension_subscriptions : AdminSubscription.related_subscriptions(@subsc)
    @admin_subsc_new = AdminSubscription.new
  end

  def update
    subsc = UserSubscription.find(params[:id])
    if subsc.update(user_subsc_params)
      redirect_to user_path(current_user)
    else
      @error_obj = subsc
      @user = current_user
      @subsc_calender = make_calender_array(get_date)
      render "public/users/show"
    end
  end

  def destroy
    subsc = Subscription.find(params[:id])
    current_user.unsubscribe(subsc)
    redirect_to user_path(current_user)
  end

  def search
    @subscriptions = AdminSubscription.with_attached_image.search(params[:keyword])
    @categories = Category.all
    render :index
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
