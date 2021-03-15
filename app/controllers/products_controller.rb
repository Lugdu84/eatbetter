class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy]
  def show
    @product = Product.find #(params[:id])
  end

  def create

  end
end


  # def create
  #   @review = Review.new(review_params)
  #   # we need `restaurant_id` to associate review with corresponding restaurant
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review.restaurant = @restaurant
  #   @review.save
  #   redirect_to restaurant_path(@restaurant)
  # end

  # private

  # def review_params
  #   params.require(:review).permit(:content)
  # end
