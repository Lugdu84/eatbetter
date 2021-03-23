class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show new create]
  def show
    # >TODO why id and farm_id ??
    @order = Order.first
    @product = Product.find(params[:farm_id])
    @order_item = OrderItem.new
    @order_item.order = @order
  end
end