class FarmsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def index
    @farms = Farm.near(params[:query], 50)

    @markers = {
      'type': 'FeatureCollection',
      'features': []
    }
    @farms.each do |farm|
      @markers[:features] << {
        type: "Feature",
        id: farm.id,
        geometry: {
          type: "Point",
          coordinates: farm.coordinates
        },
        "properties": {
          icon: {
            iconUrl: 'https://www.mapbox.com/mapbox.js/assets/images/astronaut2.png',
            iconSize: [50, 50],
            iconAnchor: [25, 25],
            popupAnchor: [0, -25],
            className: 'dot'
          },
          "name": farm.name,
          address: farm.address,
          info_window: render_to_string(
            partial: "farms/info_window",
            locals: { flat: flat }
          )
        }
      }
    end
  end

  def show
    @farm = Farm.find(params[:id])
  end
end
