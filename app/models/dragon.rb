class Dragon < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :type, presence: true
  validates :age, presence: true
  validates :price_per_day, presence: true
  validates :location, presence: true, uniqueness: true
end
