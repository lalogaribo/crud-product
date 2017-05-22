class Brand < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5, maximum: 255}
  belongs_to :user
  
end
