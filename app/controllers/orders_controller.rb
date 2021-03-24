class OrdersController < ApplicationController

  def index
    @farm = Farm.last
    @products = Product.select { |m| m.farm == @farm }
    @markets = Market.select { |m| m.farm == @farm }
    @order_items = OrderItem.all
    @sum = 0
    @order_items.each do |item|
      @sum += item.quantity * item.product.price
    end
    @sum = @sum.round(2)
  end
end
