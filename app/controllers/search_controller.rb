class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json") do |faraday|
      faraday.headers["api_key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("?fuel_type=ELEC,LPG&state=CO&limit=10&format=JSON&zip=80203")
    results = JSON.parse(response.body, symbolize_names: true)

    @stations = results.map do |station|
      Station.new(station)
    end
  end
end
