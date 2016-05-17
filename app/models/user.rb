class User < ApplicationRecord
    has_many :playlists
    has_and_belongs_to_many :playlists, :through => :favorites
    has_and_belongs_to_many :users, :through => :friends
    has_and_belongs_to_many :users, :through  => :pending_invites
end
