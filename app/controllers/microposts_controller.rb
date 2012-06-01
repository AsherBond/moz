class MicropostsController < ApplicationController
  load_and_authorize_resource :only => [:home, :new, :create, :edit, :update, :destroy]
  def home 
    @microposts = current_user.microposts
  end
  def index
    @user = User.find(params[:user_id])
    @microposts = @user.microposts
  end

  def show
    @micropost = Micropost.find(params[:id])
    @artist = User.find(@micropost.user_id)

    @commentable = @micropost
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def new
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.build
  end
  
  def create
    @user = User.find(params[:user_id])
    @micropost = @user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:notice] = "Successfully created micropost."
      redirect_to micropost_dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @micropost = Micropost.find(params[:id])
    @user = User.find(@micropost.user_id)
  end
  
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(params[:micropost])
      flash[:notice] = "Successfully updated micropost."
      redirect_to micropost_dashboard_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:notice] = "Successfully destroyed micropost."
    redirect_to micropost_dashboard_url
  end
end
