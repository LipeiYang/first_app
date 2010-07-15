class MapController < ApplicationController
  
  def index
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([33, -87],6)
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
