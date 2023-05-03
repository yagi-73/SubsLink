class Public::CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @subscriptions = @company.admin_subscriptions.no_overlap
  end
end
