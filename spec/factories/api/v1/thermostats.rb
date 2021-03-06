FactoryBot.define do
  factory :stat1, class: 'Api::V1::Thermostat' do
    household_token { "f204uc20h2l2iid8fyavonuqv287e3ca" }
    location { "berlin" }
  end
  factory :stat2, class: 'Api::V1::Thermostat' do
    household_token { "othz6i0raq22rlk1mxqmg8e0635qxtdl" }
    location { "hannover" }
  end
end
