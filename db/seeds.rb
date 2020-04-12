# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'


def seed_files(file_name, &block)
  return if !block
  csv = CSV.parse(File.read(Rails.root.join('lib', 'seeds', file_name)),
                  :headers => true,
                  :encoding => 'ISO-8859-1'
        )
  csv.each { |row| yield(row.to_hash) }
end

def create_cars( file_name, vin:, mileage:, year:,price:, color_name:, model_name:,make:,series:)
  seed_files file_name do |item|
    color = Color.find_or_create_by(name: item[color_name].upcase ) if item[color_name]
    model =  CarModel.find_or_create_by(name: item[model_name]&.downcase ,make: item[make]&.downcase,series: item[series]&.downcase )
    Car.create(
      VIN:item[vin],
      mileage:item[mileage],
      price: item[price],
      year:item[year],
      color:color,
      car_model: model
    )
  end

end

p "Initialize seed list 1"
create_cars 'vehicles_list_1.csv',
  vin: "VIN",
  mileage: "Mileage",
  price: "Buy Now Price",
  year: "Year",
  color_name: "Exterior Color",
  model_name:"Model",
  make:"Make",
  series:"Model Series"
p "Finished seed list 1"

p "Initialize seed list 2"
create_cars 'vehicles_list_2.csv' ,
  vin: "VIN",
  mileage: "MILEAGE",
  price: "PRICE",
  year: "YEAR",
  color_name: "EXTERIOR",
  model_name:"MODEL",
  make:"MAKE",
  series: "SERIES"
p "Finished seed list 2"




