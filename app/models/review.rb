class Review < ApplicationRecord
  belongs_to :field
  belongs_to :user
  validates :content, presence: true
  validates :rating, presence: true
end
