# Represents a dataset fetched from the LuftDaten.info API
# http://api.luftdaten.info/static/v1/data.json
#
# {
#   location:         {
#     indoor:         0,
#     altitude:       '47.8',
#     longitude:      '13.316',
#     latitude:       '52.456',
#     id:             9091,
#     exact_location: 0,
#     country:        'de'
#   },
#   sampling_rate:    nil,
#   timestamp:        '2019-06-07 20:14:02',
#   sensor:           {
#     sensor_type: {
#       id:           9,
#       manufacturer: 'various',
#       name:         'dht22'
#     },
#     id:          17_932,
#     pin:         '7'
#   },
#   id:               3_858_596_544,
#   sensordatavalues: [
#     {
#       value_type: 'temperature',
#       value:      '21.4',
#       id:         8_179_984_442
#     },
#     {
#       value_type: 'humidity',
#       value:      '99.9',
#       id:         8_179_984_447
#     }
#   ]
# }
# module Representers
#   class AirSensor < ::Representable::Decorator
#
#     include Representable::JSON
#
#     collection_representer class: ::AirSensor
#
#     nested :sensor do
#       property :luftdaten_id, as: :id, instance: ->(fragment) {
#         binding.pry
#         ::AirSensor.update_or_create(luftdaten_id: fragment[:doc]['id'])
#       }
#     end
#
#     property :geo_location, as: :location, class: ::GeoLocation do
#       property :longitude
#       property :latitude
#     end
#
#   end
# end
