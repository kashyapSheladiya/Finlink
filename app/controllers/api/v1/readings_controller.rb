class Api::V1::ReadingsController < ApplicationController
  before_action :authenticate
  before_action :load_reading, only: [:show]

  def index
    @readings = Api::V1::Reading.all
    json_response "All Readings", true, {readings: @readings}, :ok
  end

  def create
    @reading = Api::V1::Reading.new(reading_params)
    thermostat = Api::V1::Thermostat.where(household_token: get_household_token).first
    @reading.thermostat_id = thermostat.id
    @reading.number = increase_number(thermostat.id)
    @reading.save
    json_response "Successfully Reading created", true, @reading, :created
  end

  def show
    json_response "Reading found successfully", true, {thermostat: @reading}, :ok
  end

  private
  def load_reading
    @reading = Api::V1::Reading.find_by(id: params[:id])
    unless @reading.present?
      json_response "Reading not found", false, {}, :not_found
    end
  end

  def reading_params
    params.require(:reading).permit(:temperature, :humidity, :battery_charge)
  end

  def increase_number(id)
    last_thermostat_reading = Api::V1::Reading.where(thermostat_id: id).last
    unless last_thermostat_reading.present?
      num = 1
      return num
    end
    last_thermostat_reading.number += 1
  end
end
