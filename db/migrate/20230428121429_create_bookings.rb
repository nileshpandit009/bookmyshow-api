class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :number_of_seats
      t.string :status
      t.datetime :confirmed_at
      t.references :user
      t.references :show
      t.timestamps
    end
  end
end
