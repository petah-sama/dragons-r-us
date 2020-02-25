class Dragon < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :price_per_day, presence: true
end
