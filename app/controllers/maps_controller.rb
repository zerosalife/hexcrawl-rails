class MapsController < ApplicationController
  def show
    @code = map_params[:code]
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
