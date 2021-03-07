class Api::V1::ReadingWorker
  include Sidekiq::Worker

  def perform(reading_params, household_token)
    reading = Api::V1::Reading.new(reading_params)
    thermostat = Api::V1::Thermostat.where(household_token: household_token).first
    reading.thermostat_id = thermostat.id
    reading.number = increase_number(thermostat.id)    
    reading.save
  end

  private

  def increase_number(id)
    last_thermostat_reading = Api::V1::Reading.where(thermostat_id: id).last
    unless last_thermostat_reading.present?
      num = 1
      return num
    end
    last_thermostat_reading.number += 1
  end
end
