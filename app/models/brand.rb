class Brand < ApplicationRecord
  validates :name, presence: true, length: {maximum: 55}
  belongs_to :user
  has_many :products, dependent: :destroy
end
