class Playlist < ApplicationRecord
    belongs_to :user

    has_many :favorites
    has_many :users, through: :favorites

    has_many :playlists_songs
    has_many :songs, through: :playlists_songs

	scope :topFavs, -> {
		select("playlists.id, playlists.*, count(favorites.id) AS favs_count").
		left_joins(:favorites).
		group("playlists.id").
		order("favs_count DESC")
	}
end
