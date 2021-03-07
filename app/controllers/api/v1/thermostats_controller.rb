class Api::V1::ThermostatsController < ApplicationController
  before_action :authenticate
  before_action :load_thermostat, only: [:show]

  def index
    @thermostats = Api::V1::Thermostat.all
    thermostats_serializer = parse_json(@thermostats)
    json_response "All Thermostats", true, {thermostats: thermostats_serializer}, :ok
  end

  def show
    thermostat_serializer = parse_json(@thermostat)
    json_response "Thermostat found successfully", true, {thermostat: thermostat_serializer}, :ok
  end

  private
  def load_thermostat
    @thermostat = Api::V1::Thermostat.find_by(id: params[:id])
    unless @thermostat.present?
      json_response "Thermostat not found", false, {}, :not_found
    end
  end
end
