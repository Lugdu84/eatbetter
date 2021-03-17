class FarmsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index listFarms]

  def index
    @farms = Farm.near(params[:query], 100)
    coords = Geocoder.coordinates(params[:query])
    @markers = {
      type: 'FeatureCollection',
      coordinates: coords,
      features: []
      }
    @farms.each do |farm|
      @markers[:features] << {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: farm.coordinates
        },
        properties: {
          id: farm.id,
          category: farm.category,
          address: farm.address,
          infoWindow: render_to_string(
            partial: "info_window",
            locals: { farm: farm }
          )
        }
      }
    end
  end

  def listFarms
    @farms = Farm.all
  end

  def show
    @farm = Farm.find(params[:id])
  end

  def new
    @farm = Farm.new
  end

  def create
    @farm = Farm.new(farm_params)
    if @farm.save
      redirect_to farm_path(@farm)
    else
      render :new
    end
  end

  private

  def find_farm
    @farm = Farm.find(params[:id])
  end

  def farm_params
    params.require(:farm).permit(:name, :user_id, :content, :email, :tel, :address, :category, photos: [])
  end
end

