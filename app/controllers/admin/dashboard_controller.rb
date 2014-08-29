class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!, :is_admin?

  def home
    toast('success',"Welcome #{current_user.name}!")   
  end

  private

  def is_admin?
    if current_user.email != ENV['ADMIN_EMAIL']
      toast('error',"You're not authorized to access administration!")
      redirect_to root_path and return
    end
  end
end
