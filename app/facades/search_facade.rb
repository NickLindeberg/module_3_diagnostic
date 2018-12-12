class UserDashboardFacade

  def index
    zip = params[:zip]
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json") do |faraday|
      faraday.headers["API-KEY"] = ENV["API_KEY"]


    end
  end

end
