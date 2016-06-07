class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def discover
    if user_signed_in?
      public_playlists = Playlist.where.not(user: current_user).where(public: true)
      friends_playlists = Playlist.where(user: current_user.friends).where.not(public: true)
      
      ids = []
      public_playlists.each do |id|
        ids << id
      end
      friends_playlists.each do |id|
        ids << id
      end
      
      @playlists = Playlist.topFavs.where(id: ids).limit(10)
      
      if current_user.admin
        @playlists = Playlist.where.not(user: current_user)
      end
      
    else
      @playlists = Playlist.where(public: true).topFavs.limit(10)
    end
  end

  def favorite
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        if Playlist.find(params[:playlist]).users.include?(current_user)
          Playlist.find(params[:playlist]).users.delete(current_user)
        else
          Playlist.find(params[:playlist]).users << current_user
        end
        
        render 'update_fav_btn.js'
    end
  end

  def favorites
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        @playlists = current_user.favs
    end
  end

  # GET /playlists
  # GET /playlists.json
  def index
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        @playlists = current_user.playlists
    end
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    if @playlist.public or user_signed_in? and (@playlist.user == current_user or are_friends(current_user, @playlist.user) or current_user.admin)
        @isPlayer = true
    else
        redirect_to new_user_session_path
    end
  end

  # GET /playlists/new
  def new
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        @playlist = Playlist.new
    end
  end

  # GET /playlists/1/edit
  def edit
  end

  def by_user
    @user = User.find(params[:user_id])
    if user_signed_in? and (current_user.admin or @user == current_user or are_friends(current_user, @user))
        @playlists = Playlist.where(user: params[:user_id])
    else
        @playlists = Playlist.where(user: params[:user_id]).where(public: true)
    end
  end

  # POST /playlists
  # POST /playlists.json
  def create
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        @playlist = Playlist.new({ name: playlist_params[:name], user_id: current_user.id, public: playlist_params[:public]})

        respond_to do |format|
          if @playlist.save
            format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
            format.json { render :show, status: :created, location: @playlist }
          else
            format.html { render :new }
            format.json { render json: @playlist.errors, status: :unprocessable_entity }
          end
        end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        respond_to do |format|
          if @playlist.update(playlist_params)
            format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
            format.json { render :show, status: :ok, location: @playlist }
          else
            format.html { render :edit }
            format.json { render json: @playlist.errors, status: :unprocessable_entity }
          end
        end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    if not user_signed_in?
        redirect_to new_user_session_path
    else
        @playlist.destroy
        respond_to do |format|
          format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
  end
  
  def remove_song
    playlist = Playlist.find(params[:playlist_id])
    if user_signed_in? and playlist.user == current_user
        playlist.songs.delete(params[:song_id])
        redirect_to playlists_url + "/" + params[:playlist_id] + "/edit"
    else
        redirect_to new_user_session_path
    end
  end
  
  def format_duration(duration)
    if duration
        text = ""
        if duration > 3600
            text += String(duration / 3600) + ":"
            duration %= 3600
        end
        if duration > 60
            text += String(duration / 60) + ":"
            duration %= 60
        end
        return text + if duration < 10 then "0" + String(duration) else String(duration) end
    end
    return duration
  end
  helper_method :format_duration

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:user_id, :name, :public)
    end
    
    def are_friends(user, other_user)
        begin
            user.friends.find(other_user.id)
        rescue ActiveRecord::RecordNotFound => e
            return false
        end
        return true
    end
end
