class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :destroy]
  before_action :set_user, only: [:show, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      toast('success',"User '#{@user.name}' removed!")
      format.html { redirect_to admin_users_path }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end  
end
