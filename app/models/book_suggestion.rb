class BookSuggestion < ApplicationRecord
  validates :title, :author, :year, :publisher, :link, presence: true
  belongs_to :user
end
