class OrdersController < UsersController
  def create
    @listing = Listing.find(params[:listing_id])
    @order = @listing.orders.create(order_params.merge(user_id: current_user.id))

    if @order.save
      redirect_to user_path(current_user), notice: 'Order was successfully created.'
    else
      redirect_to listing_path(@listing), alert: 'There was an error. Please try again.'
    end
  end

  private
   def order_params
     params.require(:order).permit(:quantity)
   end
end
