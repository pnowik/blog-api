FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    subtitle { Faker::Lorem.words(8) }
    body { Faker::Lorem.words(30) }
    user_id { 1 }
  end
end
