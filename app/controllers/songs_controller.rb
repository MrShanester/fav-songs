class SongsController < ApplicationController
  def index
    input = Song.all 
    render json: input
  end

  def show
    input = params["id"]
    output = Song.find_by id: input
    render json: output
  end

  def create
    song = Song.create(
      title: params["title"],
      album: params["album"],
      artist: params["artist"],
      year: params["year"],
    )
    render json: song
  end

  def destroy
    input = params["id"]
    output = Song.find_by id: input
    output.destroy
    render json: {message: "Song Annihilated"}
  end 

  def update
    input = params["id"]
    song = Song.find_by id: input
    song.title = params["title"] || song.title
    song.album = params["album"] || song.album
    song.artist = params["artist"] || song.artist
    song.year = params["year"] || song.year
    song.save
    render json: song
  end
end
