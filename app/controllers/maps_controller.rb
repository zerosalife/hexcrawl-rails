class MapsController < ApplicationController
  def show
    @code = map_params[:code]
    @map = Map.find_by(code: @code)
    unless @map
      redirect_to root_url, flash: {warning: "Invalid map code."}
    end
  end

  def create
    @map = Map.create
    redirect_to maps_url(@map.code)
  end

  private

  def map_params
    params.permit(:code)
  end
end
