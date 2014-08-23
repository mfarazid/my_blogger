class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :validate_authorization_for_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      flash.notice = "User was successfully updated!"
      redirect_to root_path and return
    else
      render action: 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email)
    end
    
    def validate_authorization_for_user
      flash.notice = "You need to log in or sign up before continuing."
      redirect_to root_path unless @user == current_user
    end
end
