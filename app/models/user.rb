class User < ApplicationRecord
    has_many :playlists
    has_and_belongs_to_many :favorites, class_name: 'Playlist'
    has_and_belongs_to_many :friends, class_name: 'User'
    has_and_belongs_to_many :pending_invites, class_name: 'User'
end
