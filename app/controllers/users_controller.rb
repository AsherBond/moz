class UsersController < ApplicationController

  load_and_authorize_resource :only =>  [:albumdashboard, :videodashboard, :songdashboard]


  def index 
    gon.users = User.all.map &:artist_name
  	@users = User.text_search(params[:query]).page(params[:page]).per_page(3)
    render :layout => 'search'
  end

  def show

    @user = User.find(params[:id])

    @albums = @user.albums
    @videos = @user.albums
    @youtube = @user.youtubes


    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new

    #@photos = @user.photos
    #@events = @user.events
    render :layout => 'artist-profile'

  end

end