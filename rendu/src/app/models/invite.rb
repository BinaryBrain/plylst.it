class PendingInvite < ApplicationRecord
   belongs_to :user
   belongs_to :invite, :class_name => "User"  
end
