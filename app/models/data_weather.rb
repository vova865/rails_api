class DataWeather < ApplicationRecord
  validates :temperature, presence: true
end
