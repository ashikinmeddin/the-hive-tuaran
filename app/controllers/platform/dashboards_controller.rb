class Platform::DashboardsController < PlatformController
  def show
    @listing = Listing.new
    @listings = current_host.listings
  end
end
