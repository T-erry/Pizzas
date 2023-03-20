class RestaurantPizza < ApplicationRecord
  belongs_to :pizza
  belongs_to :restaurant

  validates :pizza_id, presence: true
  validates :restaurant_id, presence: true
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 30 }
  validate  :price_should_be_unique

  private 
  def price_should_be_unique
    if RestaurantPizza.where("price = ?" )
      errors.add(:price, "has already been taken")
    end
end
end
