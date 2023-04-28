class BookingSeat < ApplicationRecord
  belongs_to :screen_seat
  belongs_to :show
  belongs_to :booking
end
