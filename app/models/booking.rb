class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :field

  validates :date_from, presence: true
  validate :date_from_cannot_be_in_the_past, on: :create

  validates :date_to, presence: true
  validate :date_to_cannot_be_in_the_past, on: :create

  validate :not_overlapping
  validates :user_id, presence: true

  enum :status, %i[pending confirmed rejected], default: :pending

  def date_from_cannot_be_in_the_past
    errors.add(:date_from, "Can't be in the past") if date_from.present? && date_from < Date.today
  end

  def date_to_cannot_be_in_the_past
    errors.add(:date_to, "Can't be in the past") if date_to.present? && date_to < Date.today
  end

  def price
    field.price * (date_to - date_from).to_i
  end

  def days
    (date_to - date_from).to_i
  end

  def not_overlapping
    existing_bookings = Booking.where("date_from <= ? AND date_to >= ?", date_to, date_from)
    errors.add(:base, "Already booked for this days") if existing_bookings.any?
  end
end
