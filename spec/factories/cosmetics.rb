FactoryBot.define do
  factory :cosmetic do
    name {Faker::Commerce.product_name}
    price {Faker::Number.between(from: 500, to: 100000)}
    brand {Faker::Commerce.product_name}
    genre_id {Faker::Number.between(from: 1, to: 17)}
    usage_count_id {Faker::Number.between(from: 1, to: 5)}
    color_id {Faker::Number.between(from: 1, to: 15)}
    purchase_date {Faker::Date.backward}
    open_date {Faker::Date.backward}
    stock {Faker::Number.between(from: 0, to: 99)}
    official_url {Faker::Internet.url}
    is_favorite {Faker::Boolean.boolean}
    association :user
  end
end
