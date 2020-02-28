class Booking < ApplicationRecord
  attr_reader :total_price
  belongs_to :user
  belongs_to :dragon

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  include PgSearch::Model

  pg_search_scope :search_by_dragon_name,
    associated_against: {
      dragon: [:name, :category]
       },
    using: {
      tsearch: { prefix: true }
    }

  def total_price
    days = (self.end_date - self.start_date).to_i
    total_price = self.dragon.price_per_day * days
  end

  def countdown
    date = Date.today
    days_left = (self.start_date - date).to_i
  end

  def days_remaining
    days_left = (self.end_date - self.start_date).to_i
  end

  def start_time
    self.start_date
  end

  def end_time
    self.end_date
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
