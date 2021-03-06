class Api::V1::ThermostatsController < ApplicationController
  before_action :authenticate
  before_action :load_thermostat, only: [:show]

  def index
    @thermostats = Api::V1::Thermostat.all
    render json: @thermostats, status: :ok
  end

  def show
    render json: @thermostats, status: :ok
  end

  private
  def load_thermostat
    @thermostat = Api::V1::Thermostat.find_by(id: params[:id])
    unless @thermostat.present?
      render json: "Thermostat not found", status: :not_found
    end
  end
end
