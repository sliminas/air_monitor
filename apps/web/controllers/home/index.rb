module Web
  module Controllers
    module Home
      class Index

        include Web::Action

        expose :sensors

        def call(params)
          home = GeoLocation.new(latitude: 52.465036, longitude: 13.328644)
          resp = nil
          begin
            resp = Http.timeout(4).get("http://api.luftdaten.info/v1/filter/area=#{home},1")
          rescue HTTP::TimeoutError
          end

          @sensors =
            if resp&.code == 200
              Representers::AirSensor::Data.for_collection.new([]).from_json(resp.to_s)
            else
              []
            end.map do |data|
              sensor = AirSensor.update_or_create data.air_sensor.values
              location = GeoLocation.update_or_create data.geo_location.values, air_sensor_id: sensor.id
              sensor.geo_location = location

              data.measurements&.each do |measurement|
                AirSensor::Measurement.
                  update_or_create measurement.values.merge(air_sensor_id: sensor.id, time: data.time)
              end
              sensor
            end

        end

      end
    end
  end
end
