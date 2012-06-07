
module ApplicationHelper

	def find_artist_by_song_id(song_id)
		song = Song.find(song_id)
		song_album = Album.find(song.album)
		song_artist = User.find(song_album.user_id)
		song_artist_name = song_artist.artist_name
	end

	def make_css_for(css_class,attribute,value,append=nil,prepend=nil)
		if attribute == "background-image"
			"#{css_class} { #{attribute}: url(#{value}); }" unless value.nil?
		else
			"#{css_class} { #{attribute}: #{append}#{value}; }" unless value.nil?
		end
	end

	def is_active(value, row)
	 " active" if current_user.select(row) == "#{value}"
	end

	def only_allow_admin
	  redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_user.has_role? :admin
	end
	def only_allow_artist
	  redirect_to root_path, :alert => 'Not authorized as an artist.' unless current_user.has_role? :artist
	end
	def only_allow_fan
	  redirect_to root_path, :alert => 'Not authorized as a fan.' unless current_user.has_role? :fan
	end
end
