class CreateBookingSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_seats do |t|
      t.decimal :price
      t.string :status
      t.references :screen_seat
      t.references :show
      t.references :booking
      t.timestamps
    end
  end
end
