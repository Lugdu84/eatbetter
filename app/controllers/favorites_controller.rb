class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @farm = Farm.find(params[:farm_id])
    @favorite.farm = @farm
    @favorite.user = current_user
    @favorite.save
  end

  def index
    @favorites = current_user.favorites
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.js
      format.html { redirect_back fallback_location: farm_path(@favorite.farm) }
    end
  end
end
