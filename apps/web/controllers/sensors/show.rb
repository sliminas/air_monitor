module Web
  module Controllers
    module Sensors
      class Show

        include Web::Action
        include Pagy::Backend

        expose :sensor, :measurements, :measurement_type, :pagy_data

        def call(params)
          @sensor = AirSensor[params[:id]]
          @measurement_type = params[:type] || 'all'
          measurements = @sensor.measurements_dataset.reverse(:created_at)
          measurements = measurements.where(type: @measurement_type) if @measurement_type != 'all'

          @pagy_data, @measurements = pagy measurements
        end

        def pagy_get_vars(collection, vars)
          {
            count: collection.count,
            page:  params['page'],
            items: vars[:items] || 25
          }
        end

      end
    end
  end
end
