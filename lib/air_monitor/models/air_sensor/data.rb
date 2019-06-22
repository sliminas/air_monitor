class AirSensor < Sequel::Model
  class Data

    attr_accessor :geo_location, :air_sensor, :time, :measurements

  end
end


