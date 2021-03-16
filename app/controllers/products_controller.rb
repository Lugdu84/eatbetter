class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  def show
    @product = Product.find(params[:id])
  end
end
