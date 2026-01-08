FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    theme_color_id {Faker::Number.between(from: 2, to: 5)}
  end
end