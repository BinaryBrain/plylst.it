class Playlist < ApplicationRecord
    belongs_to :user

    has_many :favorites
    has_many :users, through: :favorites

    has_many :playlists_songs
    has_many :songs, through: :playlists_songs
end
