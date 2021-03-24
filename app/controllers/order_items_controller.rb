class OrderItemsController < ApplicationController


  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to orders_path
  end

  def create
    @order_item = OrderItem.create!(order_items_params)
    redirect_to listFarms_path(query: 'Aubagne', fruits:'on')
  end

  private

  def order_items_params
    params.require(:order_item).permit(:product_id, :market_id, :quantity, :order_id)
  end
end
