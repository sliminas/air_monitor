module Web
  module Controllers
    module Sensors
      class Index

        include Web::Action

        def call(_params)
          # AirSensor::FetchDataFromLuftdatenApi.(
          #   geo_location: GeoLocation.new(latitude: 52.465036, longitude: 13.328644)
          # )
        end

      end
    end
  end
end
