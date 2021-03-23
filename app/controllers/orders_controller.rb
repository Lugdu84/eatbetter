class OrdersController < ApplicationController

  def index
    @farm = Farm.last
    @products = Product.select { |m| m.farm == @farm }
    @markets = Market.select { |m| m.farm == @farm }
    @order_items = OrderItem.all
=begin
    @order_items = []
    @order_items << OrderItem.create!(
      order: Order.first,
      product: @products[0],
      quantity: 3,
      market: @markets.first
    )
    @order_items << OrderItem.create!(
      order: Order.first,
      product: @products[1],
      quantity: 5,
      market: @markets.first
      )
=end
  end
end
