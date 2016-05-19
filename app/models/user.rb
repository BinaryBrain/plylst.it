class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :playlists
    
    has_many :favorites
    has_many :favs, :class_name => 'Playlist', :through => :favorites
    
    has_many :friends
    has_many :users, :through => :friends
    
    has_many :pending_invites
    has_many :users, :through  => :pending_invites
end
