class BandsController < ApplicationController

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to album_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end

    # do we care about logged in user here?
  end


  def new
    @band = Band.new(params[:id])
    render :new
  end


  def show
    @band = Band.find(params[:id])
  end



  private

  def band_params
    params.require(:band).permit(:name)
  end
end
