class Product < ApplicationRecord
  belongs_to :brand
  validates :brand_id, presence: true
  validates :name, presence: true 
  validates :description, presence: true
  validates :price, presence: true, length: {maximum: 100}
  validates :name, length: { minimum: 2 }
end
