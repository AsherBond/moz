class UsersController < ApplicationController

  load_and_authorize_resource :only =>  [:albumdashboard, :videodashboard, :songdashboard]


  def albumdashboard
    @user = current_user
    @albums = @user.albums
  end

  def videodashboard
    @user = current_user
    @videos = @user.videos
    @youtube = @user.youtubes
  end

  def eventsdashboard
    @user = current_user
    @events = @user.events
  end

  def songdashboard
    @user = current_user
    @albums = @user.albums
  end

  def index 
    gon.users = User.all.map &:artist_name
  	@users = User.text_search(params[:query]).page(params[:page]).per_page(3)
    render :layout => 'search'
  end

  def show
    @user = User.find(params[:id])
    #@albums = @user.albums
    #@photos = @user.photos
    #@events = @user.events
    render :layout => 'artist-profile'
  end

end