class AlbumsController < ApplicationController
  load_and_authorize_resource :only => [:new, :create, :edit, :update, :destroy]
  def home 
    @user = current_user
    @albums = @user.albums
  end
  
  def index
    @user = User.find(params[:user_id])
    @albums = @user.albums
  end

  def show
    @album = Album.find(params[:id])
    @artist = User.find(@album.user_id)
    @songs = @album.songs

    @commentable = @album
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def new
    @user = User.find(params[:user_id])
    @album = @user.albums.build
  end
  
  def create
    @user = User.find(params[:user_id])
    @album = @user.albums.build(params[:album])
    if @album.save
      flash[:notice] = "Successfully created album."
      redirect_to album_dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
  end
  
  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(params[:album])
      flash[:notice] = "Successfully updated album."
      redirect_to album_dashboard_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    flash[:notice] = "Successfully destroyed album."
    redirect_to album_dashboard_url
  end
end