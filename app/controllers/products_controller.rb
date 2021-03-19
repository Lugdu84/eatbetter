class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  def show
    # >TODO why id and farm_id ??
    @product = Product.find(params[:farm_id])
  end
end