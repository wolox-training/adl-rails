# frozen_string_literal: true

FactoryBot.define do
  factory :book_suggestion do
    title     { Faker::Book.title }
    author    { Faker::Book.author }
    link      { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year      { Faker::Number.between(2016, 2018) }
    price     { Faker::Number.between(300, 1500) }
    synopsis  { Faker::Movie.quote }
  end
end
