class Playlist < ApplicationRecord
    belongs_to :users
    has_many :favorites
    has_many :users, through: :favorites
    has_and_belongs_to_many :songs
end
