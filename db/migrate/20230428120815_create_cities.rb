class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :pin_code
      t.timestamps
    end
  end
end
