class Field < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :featured_img, presence: true
  has_many_attached :images
end
