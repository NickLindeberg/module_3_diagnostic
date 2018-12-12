class UserSearchFacade



  def index
    @stations = Station.find_stations(params[:zip])
  end
end
