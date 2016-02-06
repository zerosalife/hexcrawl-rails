class MapsController < ApplicationController
  def show
    @code = map_params[:code]
  end

  private

  def map_params
    params.permit(:code)
  end
end
