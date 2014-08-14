class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      flash.notice = "Tag '#{@tag.name}' Removed!"
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end
    def tag_params
      params.require(:tag).permit(:name)
    end

end
