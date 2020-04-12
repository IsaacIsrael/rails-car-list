class CarModel < ApplicationRecord
  def description
    "#{make} #{name} #{series}".upcase
  end
end
