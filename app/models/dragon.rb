class Dragon < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :price_per_day, presence: true
end
