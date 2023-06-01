class Admin::CompaniesController < ApplicationController
  def index
    @companies = Company.all.with_attached_image
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else
      @companies = Company.all.with_attached_image
      render :index
    end
  end

  def show
    @company = Company.find(params[:id])
    @subscriptions = @company.admin_subscriptions.with_attached_image
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      @subscriptions = @company.admin_subscriptions.with_attached_image
      render :show
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
  end

  def search
    @companies = Company.with_attached_image.search(params[:keyword])
    @company = Company.new
    render :index
  end

  private
  def company_params
    params.require(:company).permit(:name, :image)
  end
end
