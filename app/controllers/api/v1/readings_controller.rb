class Api::V1::ReadingsController < ApplicationController
  before_action :authenticate
  before_action :load_reading, only: [:show]

  def index
    @readings = Api::V1::Reading.all
    render json: @readings, status: :ok
  end

  def create
    @reading = Api::V1::Reading.new(reading_params)
    thermostat = Api::V1::Thermostat.where(household_token: get_household_token).first
    @reading.thermostat_id = thermostat.id
    @reading.number = 1
    @reading.save
    render json: @reading, status: :created, location: @reading
  end

  def show
    render json: @reading, status: :ok
  end

  private
  def load_reading
    @reading = Api::V1::Reading.find_by(id: params[:id])
    unless @reading.present?
      render json: "Reading not found", status: :not_found
    end
  end

  def reading_params
    params.require(:reading).permit(:temperature, :humidity, :battery_charge)
  end
end
