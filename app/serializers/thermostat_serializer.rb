class ThermostatSerializer < ActiveModel::Serializer
  attributes :id, :household_token, :location,
    :average_temperature, :minimum_temperature, :maximum_temperature,
    :average_humidity, :minimum_humidity, :maximum_humidity,
    :average_battery_charge, :minimum_battery_charge, :maximum_battery_charge

  def average_temperature
    object.readings.count == 0 ? 0 : object.readings.average(:temperature).round(2)
  end

  def minimum_temperature
    object.readings.count == 0 ? 0 : object.readings.minimum(:temperature).round(2)
  end

  def maximum_temperature
    object.readings.count == 0 ? 0 : object.readings.maximum(:temperature).round(2)
  end

  def average_humidity
    object.readings.count == 0 ? 0 : object.readings.average(:humidity).round(2)
  end

  def minimum_humidity
    object.readings.count == 0 ? 0 : object.readings.minimum(:humidity).round(2)
  end

  def maximum_humidity
    object.readings.count == 0 ? 0 : object.readings.maximum(:humidity).round(2)
  end

  def average_battery_charge
    object.readings.count == 0 ? 0 : object.readings.average(:battery_charge).round(2)
  end

  def minimum_battery_charge
    object.readings.count == 0 ? 0 : object.readings.minimum(:battery_charge).round(2)
  end

  def maximum_battery_charge
    object.readings.count == 0 ? 0 : object.readings.maximum(:battery_charge).round(2)
  end
end
