class Admin::TagsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :destroy]
  before_action :set_tag, only: [:destroy]
  
  def index
    @tags = Tag.all
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      toast('success',"Tag '#{@tag.name}' removed!")
      format.html { redirect_to admin_tags_path }
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end  

end
