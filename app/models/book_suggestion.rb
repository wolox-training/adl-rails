# frozen_string_literal: true

class BookSuggestion < ApplicationRecord
  validates :title, :author, :year, :publisher, :link, presence: true
  belongs_to :user, optional: true
end
