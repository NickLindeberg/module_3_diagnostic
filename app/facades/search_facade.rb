class SearchFacade

  def initialize(zip)
    @zip = zip
  end

  def stations
    @stations = Station.find_stations(params[:zip])
  end
end
