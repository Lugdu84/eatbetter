class OrdersController < ApplicationController
  def show
    @order = current_user.orders.first
    @order_items = @order.order_items
  end

  def index
  end
end
