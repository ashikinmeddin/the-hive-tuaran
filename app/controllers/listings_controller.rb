class ListingsController < ApplicationController
  def show
    @listing = Listing.find(params[:id])
    @order = Order.new
  end
end
