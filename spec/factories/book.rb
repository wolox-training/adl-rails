FactoryBot.define do
  factory :book do
    author    { Faker::Book.author }
    genre     { Faker::Book.genre }
    image     { 'ImagenFalsa123.gif' }
    title     { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year      { '2006' }
  end
end
