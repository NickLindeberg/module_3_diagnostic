class Station

  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_times

  def initialize(attributes = {})
    @name           = attributes[:name]
    @address        = attributes[:address]
    @fuel_type      = attributes[:fuel_type]
    @distance       = attributes[:distance]
    @access_times   = attributes[:access_times].to_i
  end

  def find_stations(zip)
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json") do |faraday|
      faraday.headers["api_key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
require "pry"; binding.pry
    response = @conn.get("/fuel_type=ELEC%26LPG&state=CO&limit=10&format=JSON&zip=#{zip}")
    results = JSON.parse(response.body, symbolize_names: true)[:results]

    @stations = results.map do |station|
      Station.new(station)
    end
  end
end
