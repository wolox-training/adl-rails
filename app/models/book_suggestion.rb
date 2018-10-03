class BookSuggestion < ApplicationRecord
  validates :title, :author, :year, :publisher, :link, :user_id, presence: true
  belongs_to :user, required: true
end
