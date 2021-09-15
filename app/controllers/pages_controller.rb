class PagesController < ApplicationController
  def home
  end

  def menu
    @listings = Listing.is_available
  end

  def order
    @listings = Listing.is_available
  end

  def contact
  end

end
