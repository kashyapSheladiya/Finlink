class ReadingSerializer < ActiveModel::Serializer
  belongs_to :thermostat
  attributes :id, :number, :temperature, :humidity, :battery_charge
end
