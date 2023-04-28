class RemoveReservationWorker
  include Sidekiq::Worker

  def perform(booking_id)
    Booking.find(booking_id).destroy
  end
end
