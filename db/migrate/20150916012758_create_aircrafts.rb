class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :que_name
      t.string :aircraft_type
      t.string :aircraft_size

      t.timestamps null: false
    end
  end
end
