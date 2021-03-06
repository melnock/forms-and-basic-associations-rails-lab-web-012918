class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create

    @song = Song.new
    @song.title= params[:song][:title]
    @song.genre = Genre.find(params[:song][:genre_id])
    @song.artist_name = params[:song][:artist_name]
    @song.note_contents = params[:song][:notes]
    @song.save
    redirect_to song_path(@song)

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  # def song_params
  #   params.require(:song).permit(:title, :genre, :artist, :notes=>[])
  # end
end
