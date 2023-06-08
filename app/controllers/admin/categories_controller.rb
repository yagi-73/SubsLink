class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
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
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
