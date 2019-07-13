class LuftdatenApi

  attr_reader :response, :geo_location

  def initialize(geo_location)
    @response = nil
    @geo_location = geo_location
  end

  def get
    @response = Http.timeout(4).get("http://api.luftdaten.info/v1/filter/area=#{geo_location},1")
  rescue HTTP::TimeoutError
    Struct.new(:code).new(500)
  end

end
