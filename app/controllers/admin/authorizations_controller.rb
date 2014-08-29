class Admin::AuthorizationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  before_action :set_authorization, only: [:destroy]
  
  def index
    @authorizations = Authorization.all
  end

  def destroy
    @authorization.destroy
    if params[:back_to].present?
      respond_to do |format|
        toast('success',"Authorization '#{@authorization.provider}' removed!")
        format.html { redirect_to admin_user_path(params[:back_to]) }
      end        
    else
      respond_to do |format|
        toast('success',"Authorization '#{@authorization.provider}' removed!")
        format.html { redirect_to admin_authorizations_path }
      end
    end
  end

  private
    def set_authorization
      @authorization = Authorization.find(params[:id])
    end  

end
