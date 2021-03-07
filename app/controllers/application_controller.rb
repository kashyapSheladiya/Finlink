class ApplicationController < ActionController::API
  include Authentication
  include Response
  include SerializableResource
end
