module Authentication
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
    json_response "Unauthorized", false, {}, :unauthorized
  end

  def missing_token
    json_response "Missing Token", false, {}, :bad_request
  end
end
