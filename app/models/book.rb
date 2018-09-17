  class Book < ApplicationRecord
  validates %i[gender author image title editor year], presence: true
end
