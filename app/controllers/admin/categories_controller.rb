class Admin::CategoriesController < ApplicationController
  before_filter :authenticate
  def index
    @categories = Category.order(id: :desc).all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], flash: { notice: 'Category created!' }
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  protected 
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USERNAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
  end 
end
end
