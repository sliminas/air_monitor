class GeoLocation < Sequel::Model

  one_to_many :air_sensor

  def to_s
    "#{latitude},#{longitude}"
  end

end
