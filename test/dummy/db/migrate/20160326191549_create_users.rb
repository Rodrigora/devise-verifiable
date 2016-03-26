class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
