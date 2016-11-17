class MarkersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Marker.create!(marker_params)
    render :nothing => true
    #i assume i get some JSON from the post 
  end
  
  def show

    ul = params[:uplat]
    dl = params[:downlat]
    rl = params[:rightlong]
    ll = params[:leftlong]
    a = Marker.where("lng < ? ", rl).where("lat < ?", ul).where("lng > ?", ll).where("lat > ? ", dl).limit(100).as_json
    render :json => a
  end
  
  private 
  
  def marker_params
    params.require(:marker).permit(:lat, :lng, :cat, :dog, :mold)
  end
  
  def bound_params
    params.require(:bounds).permit(:uplat,:downlat,:rightlong,:leftlong)
  end
  
end
