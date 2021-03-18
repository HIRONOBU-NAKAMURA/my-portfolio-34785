# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "hironobu9dance@gmail.com",
             password:              "password",
             password_confirmation: "password")

# 追加のユーザーをまとめて生成する
32.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@exampleusers.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(10)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content) }
end
