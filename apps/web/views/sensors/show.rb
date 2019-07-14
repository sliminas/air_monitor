module Web
  module Views
    module Sensors
      class Show

        include Web::View
        include Pagy::Frontend

        def pagy_url_for(page, pagy)
          options = { pagy_data.vars[:page_param] => page }.merge(pagy_data.vars[:params])
          routes.sensor_path(params[:id], options)
        end

        def pagy_bootstrap_nav(*args)
          _raw super
        end

      end
    end
  end
end
