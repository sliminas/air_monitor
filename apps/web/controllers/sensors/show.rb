module Web
  module Controllers
    module Sensors
      class Show

        include Web::Action
        include Pagy::Backend

        expose :sensor, :measurements, :measurement_type, :types, :pagy_data

        def call(params)
          @sensor = AirSensor[params[:id]]
          @types = %w(temperature P1 P2).map do |type|
            type unless sensor.measurements_dataset.where(type: type).empty?
          end.compact

          @measurement_type = params[:type] || @types.first
          measurements = @sensor.measurements_dataset.reverse(:created_at)
          measurements = measurements.where(type: @measurement_type)

          @pagy_data, @measurements = pagy measurements
        end

        def pagy_get_vars(collection, vars)
          {
            count: collection.count,
            page:  params[:page],
            items: vars[:items] || 100
          }
        end

      end
    end
  end
end
