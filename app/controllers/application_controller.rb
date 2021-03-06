class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    header = get_household_token
    if header.nil?
      missing_token
    else
      authenticate_or_request_with_http_token do |token, _|
        Api::V1::Thermostat.exists?(household_token: token) ? true : unauthorized
      end
    end
  end

  def get_household_token
    header = request.headers['Authorization']
    header = header.split(' ').last unless header.nil?
    header
  end

  private

  def unauthorized
    render json: 'Unauthorized', status: :unauthorized
  end

  def missing_token
    render json: 'Missing Token', status: :bad_request
  end
end
