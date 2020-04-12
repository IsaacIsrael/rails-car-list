class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :VIN
      t.integer :mileage
      t.integer :year
      t.references :color, foreign_key: true
      t.references :car_model, foreign_key: true
      t.timestamps
    end
  end
end
