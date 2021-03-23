class OrderItemsController < ApplicationController
  def create
    @order_item = OrderItem.new(order_item_params)
    raise
    @order_item.save
    redirect_to orders_path
  end

  private

  def order_item_params
    params.require(:order_items).permit(:product, :market, :quantity, :order, :date_collect)
  end
end
