class CreateScreenSeats < ActiveRecord::Migration[6.1]
  def change
    create_table :screen_seats do |t|
      t.string :seat_number
      t.string :seat_type
      t.decimal :price
      t.references :screen
      t.timestamps
    end
  end
end
