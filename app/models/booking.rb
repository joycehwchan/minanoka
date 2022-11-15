class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :field
  validates :date_from, presence: true
  validates :date_to, presence: true
  validates :date_from, presence: true
  validates :price_per_day, presence: true
  validates :user_id, presence: true
end
