FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    email { "foo@bar.com" }
    password_digest { "foobar" }
  end
end
