# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/',                       to: 'sensors#index', as: :sensors
get '/sensors/:id', id: /\d+/, to: 'sensors#show',  as: :sensor
