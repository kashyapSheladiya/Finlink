class Api::V1::Thermostat < ApplicationRecord
  has_many :readings
  validates :household_token, presence: true, uniqueness: true, length: { is: 32 }
end
