class PagesController < ApplicationController
  def home
    @pop_songs   =  Song.order("created_at desc").limit(10)
    @new_albums  = Album.order("created_at desc").limit(10)
    @new_event   = Event.last
    @new_events  = Event.order("created_at desc").limit(10)

    @top_artists =  User.order("created_at desc").limit(3)
    @top_songs   =  Song.order("created_at desc").limit(10)
    @top_albums  = Album.order("created_at desc").limit(10)
  end

  def about
  end

  def team
  end

  def music
  	@artists = User.order("created_at desc").limit(4)
  	@albums = Album.order("created_at desc").limit(4)
  	gon.users = User.all.map &:artist_name
    render :layout => 'search'
  end

  def how_it_works
  end
end
