class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :field

  validates :date_from, presence: true
  validate :date_from_cannot_be_in_the_past, on: :create

  validates :date_to, presence: true
  validate :date_to_cannot_be_in_the_past, on: :create

  validate :not_overlapping
  validates :user_id, presence: true

  validates :price_per_day, presence: true

  validate :booking_duration

  enum status: { pending: "pending", confirmed: "confirmed", rejected: "rejected" }, _default: :pending

  def date_from_cannot_be_in_the_past
    errors.add(:date_from, "Can't be in the past") if date_from.present? && date_from < Date.today
  end

  def date_to_cannot_be_in_the_past
    errors.add(:date_to, "Can't be in the past") if date_to.present? && date_to < Date.today
  end

  def full_price
    price_per_day * (date_to - date_from).to_i
  end

  def days
    (date_to - date_from).to_i
  end

  def booking_duration
    errors.add(:base, "Minimum booking duration 1 Day") if (date_to - date_from).to_i.zero?
  end

  def not_overlapping
    existing_bookings = Booking.where("date_from <= ? AND date_to >= ? AND field_id = ? AND status != ? ", date_to, date_from,
                                      field, 'rejected').where.not(id:)
    errors.add(:base, "Already booked for this days") if existing_bookings.any?
  end
end
