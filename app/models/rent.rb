class Rent < ApplicationRecord
  validates :user_id, :book_id, :initial_date, :final_date, presence: true
  belongs_to :user
  belongs_to :book
end
