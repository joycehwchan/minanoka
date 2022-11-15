class Field < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

  def self.search(filter)
    if filter[:column_name].present?
      case filter[:column_name].downcase
      when "price"
        Field.where('price < ?', filter[:search_value].to_i)

      when "location"
        Field.where('location ILIKE ?', "%#{filter[:search_value]}%")
      when "size"
        Field.where('size < ?', filter[:search_value].to_i)
      else
        Field.all
      end
    else
      Field.all
    end
  end
end
