class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
  end
end
