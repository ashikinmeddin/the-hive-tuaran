class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: [:show, :edit, :update]

  layout 'user'

  def show
    @user = User.find(params[:id])
    @listings = Listing.is_available
    @orders = @user.orders
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    if @user.save
      redirect_to user_path(current_user), notice: 'User profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

  private
    def user_params
      params.require(:user).permit(:avatar)
    end

    #def set_user
    #@user = User.find(params[:id])
    #end
end
