# Represents a dataset fetched from the LuftDaten.info API
# http://api.luftdaten.info/static/v1/data.json
#

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
class AirSensor < Sequel::Model
  class Measurement < Sequel::Model

  end
end


