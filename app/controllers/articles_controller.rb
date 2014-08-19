class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
    @article.increment!(:view_count)
  end

  def new
    @article = Article.new
    
  end

  def edit
    if @article.user_id != current_user.id
      flash.notice = "You're Not Authorized to edit this Article!"
      redirect_to articles_url
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    respond_to do |format|
      if @article.save
        flash.notice = "Article '#{@article.title}' Created!"
        format.html { redirect_to @article }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        flash.notice = "Article '#{@article.title}' Updated!"
        format.html { redirect_to @article }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @article.user_id != current_user.id
      flash.notice = "You're Not Authorized to delete this Article!"
      redirect_to articles_url
    else
      @article.destroy
      respond_to do |format|
        flash.notice = "Article '#{@article.title}' Removed!"
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    end
  end

  def like
    @article = Article.find(params[:id])
    @article.increment!(:like)
    respond_to do |format|
      format.json { render action: 'show'}
    end
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :tag_list, :image, :user_id)
    end
end
