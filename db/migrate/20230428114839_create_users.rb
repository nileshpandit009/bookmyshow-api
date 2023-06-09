class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :phone_number
      t.references :role
      t.timestamps
    end
  end
end
