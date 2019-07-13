class AirSensor < Sequel::Model
  class FetchDataFromLuftdatenApi

    def self.call(geo_location:)
      resp = LuftdatenApi.new(geo_location).get
      return unless resp.code == 200

      sensor_data = Representers::AirSensor::Data.for_collection.new([]).from_json(resp.to_s)

      sensor_data.each do |data|
        sensor              = AirSensor.update_or_create data.air_sensor.values
        location            = GeoLocation.update_or_create data.geo_location.values, air_sensor_id: sensor.id
        sensor.geo_location = location

        data.measurements&.each do |measurement|
          AirSensor::Measurement.
            update_or_create measurement.values.merge(air_sensor_id: sensor.id, time: data.time)
        end
      end
    end

  end
end
