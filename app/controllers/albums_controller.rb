class AlbumsController < ApplicationController

  before_action :require_login

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end

    # do we care about logged in user here?
  end


  def new
    @album = Album.new(band_id: params[:band_id])
    render :new
  end


  def show
    @album = Album.find(params[:id])
  end



  private

  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end
end
