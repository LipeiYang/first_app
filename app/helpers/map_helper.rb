require "google_geocode"
module MapHelper
  
  def crt_map
    # Create a new map object, also defining the div ("map") 
    # where the map will be rendered in the view
    @map = GMap.new("map")
    # Use the larger pan/zoom control but disable the map type
    # selector
    @map.control_init(:large_map => true,:map_type => true)
    # Center the map on specific coordinates and focus in fairly
    # closely
    @map.center_zoom_init([41.023849,-80.682053], 10)
    
    ianazones_address = "Ianazone's<br />8590 Glenwood Ave<br />Boardman, OH 44512"
    
    ianazones = GMarker.new([41.023849,-80.682053],
      :title => "Ianazone's Pizza", 
      :info_window => "#{ianazones_address}")
    @map.overlay_init(ianazones)
    
    belleria_address = "Belleria's<br />789 Wick Ave<br />Youngstown, OH 44505"
    
    belleria = GMarker.new([41.111141,-80.641281],
      :title => "Belleria's", 
      :info_window => "#{belleria_address}")
    @map.overlay_init(belleria)    

    gg = GoogleGeocode.new YAML.load_file(RAILS_ROOT +‘/config/gmaps_api_key.yml’)[ENV['RAILS_ENV']]

  end
  
end
