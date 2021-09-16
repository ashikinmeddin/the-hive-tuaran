class Platform::HostsController < PlatformController

  def edit
  end

  def destroy
    Host.find(params[:id]).destroy
    session[:host_id] = nil
    redirect_to new_platform_host_path
  end

end
