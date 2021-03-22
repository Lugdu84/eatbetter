class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @farm = Farm.find(params[:farm_id])
    @favorite.farm = @farm
    @favorite.user = current_user
    #no rediraction when adding a favorite as it s not logical in user flow
  end

  def myfavorites
    @favorites = current_user.favorites
  end

  # def destroy
  # end
end


# class BookingsController < ApplicationController
#   def create
#     @booking = Booking.new(booking_params)
#     @bike = Bike.find(params[:bike_id])
#     @booking.bike = @bike
#     @booking.user = current_user
#     if @booking.save
#       redirect_to mybookings_path
#     else
#       render "bikes/show"
#     end
#   end

#   def mybookings
#     @bookings = current_user.bookings
#   end

#   private

#   def booking_params
#     params.require(:booking).permit(:booking_start, :booking_end)
#   end
# end
