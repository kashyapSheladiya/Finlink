FactoryBot.define do
  factory :reading, class: 'Api::V1::Reading' do
    thermostat 
    number { 1 }
    temperature { "9.99" }
    humidity { "9.99" }
    battery_charge { "9.99" }
  end
end
