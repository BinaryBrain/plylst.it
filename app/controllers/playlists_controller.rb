class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  def discover
    @playlists = Playlist.all
  end

  def favorite
    if Playlist.find(params[:playlist]).users.include?(current_user)
      Playlist.find(params[:playlist]).users.delete(current_user)
    else
      Playlist.find(params[:playlist]).users << current_user
    end

    render 'update_fav_btn.js'
  end

  def favorites
    @playlists = current_user.favs
  end

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = current_user.playlists
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new({ name: playlist_params[:name], user_id: current_user.id })

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

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
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

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def pouet(duration)
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
  helper_method :pouet

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:user_id, :name)
    end
end
