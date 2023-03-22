class RestaurantPizza < ApplicationRecord
  belongs_to :pizza
  belongs_to :restaurant

  validates :pizza_id, presence: true
  validates :restaurant_id, presence: true
  validates :pizza_id, uniqueness: { scope: :restaurant_id, message: 'already added to the restaurant' }
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 30 }
  
end
