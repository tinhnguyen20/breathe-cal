class MarkersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    marker = Marker.create!(marker_params)
    puts marker
    render :json => marker
    #i assume i get some JSON from the post 
  end
  
  def show
    puts bound_params
    up = bound_params[:uplat]
    down = bound_params[:downlat]
    left = bound_params[:leftlong]
    right = bound_params[:rightlong]
    markers = Marker.find_all_within_bounds(up,down,left,right)
    render :json => markers
  end
  
  private 
  
  def marker_params
    params.require(:marker).permit(:lat, :lng, :cat, :dog, :mold)
  end
  
  def bound_params
    params.require(:bounds).permit(:uplat,:downlat,:rightlong,:leftlong)
  end
  
end
