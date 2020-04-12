class Car < ApplicationRecord
  include Filterable

  belongs_to :color, optional: true
  belongs_to :car_model
  monetize :price_cents

  scope :mileage_filter, ->(mileage) { where('mileage >= ?', mileage) }
  scope :price_filter, ->(price) { where('price_cents >= ?', price.to_money.cents) }
  scope :color_filter, ->(color) { where(color_id: color.to_i) }
end
