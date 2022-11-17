class Field < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :size, presence: true
  validates :rich_description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  has_rich_text :rich_description
  geocoded_by :location
  has_many_attached :images
  after_validation :geocode, if: :will_save_change_to_location?

  def self.search(filter)
    if filter[:column_name].present?
      case filter[:column_name].downcase
      when "price"
        Field.where('price < ?', filter[:search_value])
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
