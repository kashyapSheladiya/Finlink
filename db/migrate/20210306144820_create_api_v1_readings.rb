class CreateApiV1Readings < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_readings do |t|
      t.references :thermostat, foreign_key: true
      t.integer :number
      t.decimal :temperature
      t.decimal :humidity
      t.decimal :battery_charge

      t.timestamps
    end
  end
end
