class Public::CompaniesController < ApplicationController
  before_action :set_subsc_form
  before_action :get_top_subscriptions
  before_action :get_recommended_users

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @subscriptions = @company.admin_subscriptions.no_overlap
  end
end
