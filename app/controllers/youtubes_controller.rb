class YoutubesController < ApplicationController
  load_and_authorize_resource :only => [:new, :create, :edit, :update, :destroy]

  def index
    @youtube = Youtube.all
  end


  def show
    @youtube = Youtube.find(params[:id])
    @commentable = @youtube
    @comments = @commentable.comments
    @comment = Comment.new
  end


  def new
    @user = User.find(params[:user_id])
    @youtube = @user.youtubes.build
  end


  def edit
    @youtube = Youtube.find(params[:id])
    @user = User.find(@youtube.user_id)
  end


  def create
    @user = User.find(params[:user_id])
    @youtube = @user.youtubes.build(params[:youtube])
    if @youtube.save
      flash[:notice] = "Successfully created video."
      redirect_to video_dashboard_url
    else
      render :action => 'new'
    end
  end


  def update
    @youtube = Youtube.find(params[:id])
    if @youtube.update_attributes(params[:youtube])
      flash[:notice] = "Successfully updated video."
      redirect_to video_dashboard_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @youtube = Youtube.find(params[:id])
    @youtube.destroy
    flash[:notice] = "Successfully destroyed video."
    redirect_to video_dashboard_url
  end

end
