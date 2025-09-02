class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :profile, :occupation, :position, presence: true

  has_many :prototypes
end