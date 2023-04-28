class Booking < ApplicationRecord
  has_many :booking_seats
  belongs_to :user
  belongs_to :show

  def confirm
    booking_seats.update_all(status: 'confirmed')
    self.confirmed_at = DateTime.now
    self.status = 'confirmed'
    save
  end
end
