class Api::V1::ReadingsController < ApplicationController
  before_action :authenticate
  before_action :load_reading, only: [:show]

  def index
    @readings = Api::V1::Reading.all
    readings_serializer = parse_json(@readings)
    json_response "All Readings", true, {thermostats: readings_serializer}, :ok
  end

  def create
    Api::V1::ReadingWorker.perform_async(reading_params.to_h, get_household_token)
    reading = reading_params
    json_response "Reading created successfully", true, {reading: reading}, :created
  end

  def show
    reading_serializer = parse_json(@reading)
    json_response "Reading found successfully", true, {reading: reading_serializer}, :ok
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
end
