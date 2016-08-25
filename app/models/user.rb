class User < ApplicationRecord
  has_many :identities

  validates :login, presence: true
  validates :email, presence: true
end
