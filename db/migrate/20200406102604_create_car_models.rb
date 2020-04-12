class CreateCarModels < ActiveRecord::Migration[5.2]
  def change
    create_table :car_models do |t|
      t.string :name
      t.string :make
      t.string :series
      t.timestamps
    end
  end
end
