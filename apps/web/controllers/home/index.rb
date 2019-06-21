module Web
  module Controllers
    module Home
      class Index

        include Web::Action

        expose :data

        def call(params)
          home = GeoLocation.new(latitude: 52.465036, longitude: 13.328644)
          resp = Http.timeout(2).get("http://api.luftdaten.info/v1/filter/area=#{home},1")
          # @data = JSON.parse(resp.to_s).map(&:deep_symbolize_keys)

          binding.pry
          sensor_datas = Representers::AirSensor::Data.for_collection.new([]).from_json(resp.to_s)
        end

      end
    end
  end
end

# [{ location: { indoor: 0, altitude: '47.8', longitude: '13.316', latitude: '52.456', id: 9091, exact_location: 0, country: 'de' }, sampling_rate: nil, timestamp: '2019-06-07 20:14:02', sensor: { sensor_type: { id: 9, manufacturer: 'various', name: 'dht22' }, id: 17932, pin: '7' }, id: 3858596544, sensordatavalues: [{ value_type: 'temperature', value: '21.4', id: 8179984442 }, { value_type: 'humidity', value: '99.9', id: 8179984447 }]
# }
# ]
