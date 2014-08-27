class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:start_date].present? && params[:end_date].present?
      @articles = Article.created_between(params[:start_date],params[:end_date]).where(:hidden => false).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    else
      @articles = Article.where(:hidden => false).paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
    end
    @tags = Tag.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
    @article.increment!(:view_count)
    if @article.hidden == true 
      toast('error','This article is currently unavailable to view at this time!')
      redirect_to articles_url
    end
  end

  def new
    @article = Article.new
    
  end

  def edit
    if @article.user_id != current_user.id
      toast('error',"You're not authorized to update this article!")
      redirect_to articles_url
    end
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    respond_to do |format|
      if @article.save
        ArticleMailer.article_submitted(@article).deliver
        toast('success',"Thank you for your submission. This article needs an administrative approval before publishing to the elphax blogger.")
        format.html { redirect_to articles_url }
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
        toast('success',"Article '#{@article.title}' updated!")
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
      toast('error',"You're not authorized to delete this article!")
      redirect_to articles_url
    else
      @article.destroy
      respond_to do |format|
        toast('success',"Article '#{@article.title}' removed!")
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
      params.require(:article).permit(:title, :content, :tag_list, :image, :user_id, :hidden, :published_at, :like, :view_count)
    end
end
