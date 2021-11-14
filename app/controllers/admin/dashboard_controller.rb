class Admin::DashboardController < ApplicationController

  def show
    # @category = Category.order(id: :desc).all
    @category = Category.all
    @products = Product.order(id: :desc).all
  end
end
