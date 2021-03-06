FactoryBot.define do
  factory :stat1, class: 'Api::V1::Thermostat' do
    household_token { "f204uc20h2l2iid8fyavonuqv287e3ca" }
    location { "berlin" }
  end
  factory :stat2, class: 'Api::V1::Thermostat' do
    household_token { "othz6i0raq22rlk1mxqmg8e0635qxtdl" }
    location { "hannover" }
  end
  factory :stat3, class: 'Api::V1::Thermostat' do
    household_token { "hacpypfk58iv1e6p6x9qgec3l0f4d4cx" }
    location { "munich" }
  end
  factory :stat4, class: 'Api::V1::Thermostat' do
    household_token { "f4rfpxkvqhtg0qcse2r4w5ehkskbnvrg" }
    location { "kiel" }
  end
  factory :stat5, class: 'Api::V1::Thermostat' do
    household_token { "80ee56rv8p7t46j5pw359ohjqy6e1c5x" }
    location { "hamburg" }
  end
  factory :stat6, class: 'Api::V1::Thermostat' do
    household_token { "c1q86ksax31a2lpxlxbahfs1lcjzyqdk" }
    location { "frankfurt" }
  end
end
