Sequel.migration do
  change do
    create_table :air_sensor_measurements do
      primary_key :id
      column :luftdaten_id, Numeric, null: false
      foreign_key :air_sensor_id, :air_sensors, null: false, on_delete: :cascade

      column :type, String, null: false
      column :value, Float, null: false
      column :time, DateTime, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
