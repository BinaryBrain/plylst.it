class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    data = ""
    cmd = "youtube-dl -J " + song_params[:original_url] + " 2>> /dev/null"
    IO.popen(cmd) { |f| data = f.gets }
    metadata = JSON.parse(data)

    filename = `date +%s%N | tr -d "\n"`

    value = system("youtube-dl", song_params[:original_url], "-x", "--audio-format", "mp3", "-o", Dir.pwd + "/public/downloads/" + filename + ".%(ext)s")
    
    @song = Song.new({ filename: filename, name: metadata["title"], original_url: song_params[:original_url] })
    @song.playlists << Playlist.where(id: song_params[:playlist_ids])

    respond_to do |format|
      if @song.save and value
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :filename, :original_url, :playlist_ids => [])
    end
end
