module Web
  module Controllers
    module Sensors
      class Show

        include Web::Action

        expose :sensor

        def call(params)
          @sensor = AirSensor[params[:id]]
        end

      end
    end
  end
end
