class Station

  def find_stations(zip)
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json") do |faraday|
      faraday.headers["api_key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/fuel_type=ELEC%26LPG&state=CO&limit=10&format=JSON&zip=#{zip}")
    results = JSON.parse(response.body, symbolize_names: true)[:results]

    @stations = results.map do |station|
      Station.new(station)
    end
  end
end
