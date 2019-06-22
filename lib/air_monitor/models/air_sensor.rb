# Represents a sensor from the LuftDaten.info
# http://api.luftdaten.info/static/v1/data.json
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
class AirSensor < Sequel::Model

  plugin :update_or_create

  one_to_one :geo_location
  one_to_many :measurements, class: 'AirSensor::Measurement'

end


