class BookingsController < ApplicationController
  # User selects movie
  # user is shown a list of theaters.
  # user selects a theater
  # shown a list of show timings
  # selects a show
  # selects seats
  # click book
  # background - reserve seats - update status in booking_seats table with timeout
  # payment
  def create
    @booking = create_booking
    return false if unavailable?

    reserve_seats

    # redirect to payments page
    # after payment success, trigger event to update booking record.
    # Not destroying the booking if payment fails because the user might retry payment.
  end

  # This action should get called after payment success.
  def confirm_booking
    @booking.confirm
  end

  def method_name; end

  private

  def create_booking
    Booking.create(
      number_of_seats: booking_params[:seats].uniq.count,
      user_id: booking_params[:user_id],
      status: 'pending'
    )
  end

  def reserve_seats
    show_id = booking_params[:show_id]
    screen_id = Show.find(show_id).select('screen_id')
    seats = booking_params[:seats]

    screen_seats = ScreenSeat.where(screen_id: screen_id, seat_number: seats).pluck(:id, :price)
    values = screen_seats.map do |ss|
      {
        screen_seat_id: ss[:id],
        price: ss[:price],
        show_id: show_id,
        booking_id: @booking.id,
        status: 'reserved'
      }
    end

    # activerecord-import gem
    BookingSeat.import(values)

    RemoveReservationWorker.perform_in(5.minutes, @booking.id)
  end

  def unavailable?
    BookingSeat
      .joins(:screen_seat)
      .where(
        show_id: booking_params[:show_id],
        screen_seats: { seat_number: booking_params[:seats] }
      ).any?
  end

  # dummy
  def booking_params
    {
      user_id: 111,
      show_id: 213,
      seats: ['A11, A12, A13']
    }
  end
end
