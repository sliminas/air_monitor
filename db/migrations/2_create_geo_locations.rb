Sequel.migration do
  change do
    create_table :geo_locations do
      primary_key :id
      column :luftdaten_id, Integer, null: false
      foreign_key :air_sensor_id, :air_sensors, null: false, on_delete: :set_null

      column :latitude,  Float, null: false
      column :longitude, Float, null: false

      column :name, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
