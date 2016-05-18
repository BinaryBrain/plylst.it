class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :playlists
    has_and_belongs_to_many :playlists, :through => :favorites
    has_and_belongs_to_many :users, :through => :friends
    has_and_belongs_to_many :users, :through  => :pending_invites
end
