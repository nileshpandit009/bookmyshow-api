class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.references :movie
      t.references :screen
      t.timestamps
    end
  end
end
