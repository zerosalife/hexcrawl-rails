class MainController < ApplicationController
  def index
  end

  def crawl
    redirect_to maps_path(map_params[:code])
  end

  private

  def map_params
    params.permit(:code)
  end
end
