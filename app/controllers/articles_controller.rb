class ArticlesController < ApplicationController
  load_and_authorize_resource :only => [:home, :new, :create, :edit, :update, :destroy]
  def home 
    @articles = current_user.articles
  end
  def index
    @user = User.find(params[:user_id])
    @articles = @user.articles
  end

  def show
    @article = Article.find(params[:id])
    @artist = User.find(@article.user_id)

    @commentable = @article
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def new
    @user = User.find(params[:user_id])
    @article = @user.articles.build
  end
  
  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.build(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article."
      redirect_to article_dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article."
      redirect_to article_dashboard_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully destroyed article."
    redirect_to article_dashboard_url
  end
end
