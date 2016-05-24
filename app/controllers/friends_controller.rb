class FriendsController < ApplicationController
  def show
    @users = current_user.friends
    @invites = current_user.invites
  end

  # Invite user :user_id to be a friend
  def invite
    User.find(params[:user_id]).invites << current_user
  end

  # Accept an invite from user :user_id
  def accept
    invites = PendingInvite.where(user_id: current_user, invite_id: params[:user_id])

    if invites.exists?
      # Remove invite
      invites.destroy_all

      # Add firendship relation
      User.find(params[:user_id]).friends << current_user
      current_user.friends << User.find(params[:user_id])
    end
  end

  # Remove user :user_id from friends
  def remove
    User.find(params[:user_id]).friends.delete(current_user)
    current_user.friends.delete(User.find(params[:user_id]))
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:user_id, :name)
    end
end
