class AddPriceToCar < ActiveRecord::Migration[5.2]
  def change
     add_monetize :cars, :price
  end
end
