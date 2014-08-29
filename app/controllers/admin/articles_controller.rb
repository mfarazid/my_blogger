class Admin::ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :destroy]
  before_action :set_article, only: [:show, :destroy, :update]
  
  def index
    @articles = Article.all
  end

  def show
  end
  
  def update
    if @article.update(article_params)
      @article.published_at = Time.now 
      @article.save 
      toast('success',"blog #{@article.title} is now published!")
      redirect_to admin_article_path(@article)
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      toast('success',"Blog '#{@article.title}' removed!")
      format.html { redirect_to admin_articles_path }
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end  
    
    def article_params
      params.require(:article).permit(:title, :content, :tag_list, :image, :user_id, :published, :published_at, :like, :view_count)
    end
end
