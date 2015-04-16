class TracksController < ApplicationController

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to album_url(@track.album.id)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end

    # do we care about logged in user here?
  end


  def new
    @track = Track.new(album_id: params[:album_id])
    render :new
  end


  def show
    @track = Track.find(params[:id])
  end



  private

  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
