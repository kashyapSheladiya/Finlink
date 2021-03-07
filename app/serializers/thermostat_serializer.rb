class ThermostatSerializer < ActiveModel::Serializer
  attributes :id, :household_token, :location, :temperature, :humidity, :battery_charge

    def temperature
      hash = {:average => 0, :minimum => 0, :maximum => 0}
      record = object.readings
      unless record.count == 0
        average = object.readings.average(:temperature).round(2)
        minimum = object.readings.minimum(:temperature).round(2)
        maximum = object.readings.maximum(:temperature).round(2)
        hash = {:average => average, :minimum => minimum, :maximum => maximum}
      end
      hash
    end

    def humidity
      hash = {:average => 0, :minimum => 0, :maximum => 0}
      record = object.readings
      unless record.count == 0
        average = object.readings.average(:humidity).round(2)
        minimum = object.readings.minimum(:humidity).round(2)
        maximum = object.readings.maximum(:humidity).round(2)
        hash = {:average => average, :minimum => minimum, :maximum => maximum}
      end
      hash
    end

    def battery_charge
      hash = {:average => 0, :minimum => 0, :maximum => 0}
      record = object.readings
      unless record.count == 0
        average = object.readings.average(:battery_charge).round(2)
        minimum = object.readings.minimum(:battery_charge).round(2)
        maximum = object.readings.maximum(:battery_charge).round(2)
        hash = {:average => average, :minimum => minimum, :maximum => maximum}
      end
      hash
    end
end
