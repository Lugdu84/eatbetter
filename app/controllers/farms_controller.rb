class FarmsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

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
          info_window: render_to_string(
            partial: "farms/info_window",
            locals: { farm: farm }
          )
        }
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
  end
end

