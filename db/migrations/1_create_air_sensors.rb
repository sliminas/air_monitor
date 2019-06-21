Sequel.migration do
  change do
    create_table :air_sensors do
      primary_key :id
      column :luftdaten_id, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
