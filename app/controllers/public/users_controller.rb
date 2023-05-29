class Public::UsersController < ApplicationController
  before_action :set_subsc_form, omly: [ :index, :show, :edit, :search]
  before_action :get_top_subscriptions, omly: [ :index, :show, :edit, :search]

  def index
    @user = User.find(params[:user_id])
    @followings = @user.followings.with_attached_image
    @followers = @user.followers.with_attached_image
    @mutually_followings = @followings & @followers
  end

  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user
    @subsc_calender = make_calender_array(get_date)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @user.reload
      @error_obj = @user
      @subsc_calender = make_calender_array(get_date)
      render :show
    end
  end

  def search
    @user = User.find_by(tag: params[:user_tag])
    if @user
      @subsc_calender = make_calender_array(get_date)
      render :show
    else
      redirect_to user_relationships_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
