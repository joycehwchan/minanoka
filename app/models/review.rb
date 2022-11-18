class Review < ApplicationRecord
  belongs_to :field
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true
  validate :validate_user_for_review

  def validate_user_for_review
    errors.add(:base, "You haven't booked this field previusly!") unless Booking.where("user_id = ? AND field_id = ?", user.id, field.id).length >= 1
    # Add date_to in the condition for proper restrictions.
  end
end
