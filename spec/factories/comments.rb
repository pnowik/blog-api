FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.words(10) }
    published { false }
    post_id { nil }
    user_id { 1 }
  end
end
