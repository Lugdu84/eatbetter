class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy]
  def show
    @product = Product.find #(params[:id])
    #1503SHOW A VERIFIER AVEC UN TA PUSHER SUR MASTER SANS CETTE VERIF
  end
end
