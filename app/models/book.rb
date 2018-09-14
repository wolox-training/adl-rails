class Book < ApplicationRecord
  validates :gender, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :editor, presence: true
  validates :year, presence: true
end
