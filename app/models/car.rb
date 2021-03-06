class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  CATEGORIES = ['Luxury', 'Economy', 'Electric']

  def unavailable_dates
    bookings.pluck(:starting_date, :ending_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
