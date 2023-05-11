class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']

  # Add metrics to Admin dashboard
  def show
    @products_count = Product.count
    @categories_count = Category.count
  end
  
end
