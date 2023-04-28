class User < ApplicationRecord
  has_many :bookings
  belongs_to :role
end
