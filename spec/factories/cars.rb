FactoryBot.define do
  factory :car do
    sequence(:VIN) { |n| "CAR#{n}" }
    sequence(:mileage) { |n| n }
    sequence(:year) { |n| n%2== 0 ? 2020 : 2010 }
    sequence(:price) { |n| n }
    sequence(:color) { |n| Color.find_or_create_by(name: n %2 == 0 ? "white" : "black") }
    car_model
  end
end
