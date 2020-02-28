class Dragon < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :category, presence: true
  validates :age, presence: true
  validates :price_per_day, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_name_and_category,
    against: [ :name, :category, :age, :address],
    associated_against: {
      user: [ :first_name, :last_name ]
       },
    using: {
      tsearch: { prefix: true }
    }
end



