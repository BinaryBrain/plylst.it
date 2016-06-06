class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :playlists
    
    has_many :favorites
    has_many :favs, :through => :favorites, :source => :playlist
    
    has_many :friendships
    has_many :friends, :through => :friendships

    has_many :pending_invites
    has_many :invites, :through => :pending_invites
    
    after_commit :set_admin
    
    def set_admin
        if User.count == 1
            puts "First account is ADMIN"
            self.admin = true
        end
    end
end
