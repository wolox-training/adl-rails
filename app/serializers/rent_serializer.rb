# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id, :initial_date, :final_date
  belongs_to :user
  belongs_to :book
end
