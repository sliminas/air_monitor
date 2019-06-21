Sequel.migration do
  change do
    create_table(:air_sensors) do
      primary_key :id
      column :luftdaten_id, "integer", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
    end
    
    create_table(:geo_locations) do
      primary_key :id
      column :name, "text"
      column :latitude, "double precision", :null=>false
      column :longitude, "double precision", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
    end
    
    create_table(:schema_info) do
      column :version, "integer", :default=>0, :null=>false
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
