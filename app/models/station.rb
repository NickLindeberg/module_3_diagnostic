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

  
end
