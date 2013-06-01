class MapPresenter
  def initialize(dataset)
    @dataset = dataset
  end
  
  def leaflet_geojson
    MultiJson.encode(@dataset.map_obj) 
  end
end