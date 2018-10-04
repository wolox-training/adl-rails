# frozen_string_literal: true

class Rent < ApplicationRecord
  validates :user_id, :book_id, :initial_date, :final_date, presence: true
  belongs_to :user, required: true
  belongs_to :book, required: true
end
