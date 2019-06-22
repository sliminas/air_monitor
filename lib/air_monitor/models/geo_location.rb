class GeoLocation < Sequel::Model

  plugin :update_or_create

  many_to_one :air_sensor

  def to_s
    "#{latitude},#{longitude}"
  end

end
