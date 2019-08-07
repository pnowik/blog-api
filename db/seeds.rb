50.times do
  post = Post.create(title: Faker::Lorem.word, subtitle: Faker::Lorem.words(15), body: Faker::Lorem.words(40), created_by: 1)
end