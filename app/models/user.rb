# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :registerable, :omniauthable
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :locale, presence: true
  before_save :skip_confirmation!
  has_one :rent, dependent: :destroy
end
