FactoryBot.define do
  factory :comment do
    content {Faker::Lorem.sentence}
    rating {Faker::Number.between(from: 1, to: 5)}
    status_id {Faker::Number.between(from: 1, to: 3)}
    association :cosmetic
  end
end