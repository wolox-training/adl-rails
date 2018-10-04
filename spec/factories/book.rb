# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    author    { Faker::Book.author }
    genre     { Faker::Book.genre }
    image     { Faker::Avatar.image }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year      { Faker::Number.between(1500, 2018) }
  end
end
