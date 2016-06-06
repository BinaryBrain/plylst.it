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
    
  # Source: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
end
