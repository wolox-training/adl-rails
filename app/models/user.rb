class User < ApplicationRecord
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
