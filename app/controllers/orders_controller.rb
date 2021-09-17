class OrdersController < UsersController
  def create
    @listing = Listing.find(params[:listing_id])
    @order = @listing.orders.create(order_params.merge(user_id: current_user.id))

    if @order.save
      redirect_to user_path(current_user), notice: 'Order was successfully created.'
      Orders.new_order_notification(@order).deliver_now
    else
      redirect_to listing_path(@listing), alert: 'There was an error. Please try again.'
    end
  end

  def show
  @order = Order.find(params[:id])
  end

  def payment_details
  @order = Order.find(params[:order_id])
  end

  def success
  end

  def cancel
  end

  private
   def order_params
     params.require(:order).permit(:quantity)
   end
end
