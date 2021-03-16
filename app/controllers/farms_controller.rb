class FarmsController < ApplicationController
skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @farms = Farm.all
    # a revoir
  end

  def show
    @farm = Farm.find(params[:id])
  end
end
