class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      toast('success','User was successfully updated!')
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

end
