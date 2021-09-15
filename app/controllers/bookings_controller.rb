class BookingsController < UsersController
  def create
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.create(booking_params.merge(user_id: current_user.id))

    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was successfully created.'
    else
      redirect_to listing_path(@listing), alert: 'There was an error. Please try again.'
    end
  end

  private
   def booking_params
     params.require(:booking).permit(:quantity)
   end
end
