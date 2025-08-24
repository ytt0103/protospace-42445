class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :profile, :department, :position, presence: true

  has_many :prototypes
end