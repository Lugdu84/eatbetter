class OrdersController < ApplicationController

  def index
    @order_items = OrderItem.all
    @sum = 0
    @order_items.each do |item|
      @sum += item.quantity * item.product.price
    end
    @sum = @sum.round(2)
    @farm = @order_items[0].market.farm unless @order_items.blank?
    @products = Product.select { |m| m.farm == @farm }
    @markets = Market.select { |m| m.farm == @farm }
  end
end
