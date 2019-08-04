class AirSensor < Sequel::Model
  class FetchDataFromLuftdatenApi

    class << self

      def call(geo_location:)
        resp =
          begin
            LuftdatenApi.new(geo_location).get
          rescue Http::TimeoutError
            @retries ||= 0
            retry unless (@retries += 1) > 2
          end

        return unless resp&.code == 200

        sensor_data = Representers::AirSensor::Data.for_collection.new([]).from_json(resp.to_s)

        sensor_data.each { |data| import data }
      end

      def import(data)
        sensor              = AirSensor.update_or_create data.air_sensor.values
        location            = GeoLocation.update_or_create data.geo_location.values, air_sensor_id: sensor.id
        sensor.geo_location = location

        data.measurements&.each do |measurement|
          next if measurement.luftdaten_id.blank?

          AirSensor::Measurement.
            update_or_create measurement.values.merge(air_sensor_id: sensor.id, time: data.time)
        end

      end

    end

  end
end
