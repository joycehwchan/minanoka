class Field < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
end
