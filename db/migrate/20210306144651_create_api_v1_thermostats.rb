class CreateApiV1Thermostats < ActiveRecord::Migration[5.2]
  def change
    create_table :api_v1_thermostats do |t|
      t.text :household_token
      t.text :location

      t.timestamps
    end
  end
end
