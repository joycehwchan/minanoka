class Review < ApplicationRecord
  belongs_to :field
  belongs_to :user
end
