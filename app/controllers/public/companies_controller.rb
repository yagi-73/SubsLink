class Public::CompaniesController < ApplicationController
  before_action :set_subsc_form
  before_action :get_top_subscriptions
  before_action :get_recommended_users

  def show
    @company = Company.find(params[:id])
    @subscriptions = @company.admin_subscriptions.with_attached_image.where(is_basic: true)
  end
end
