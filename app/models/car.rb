class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  CATEGORIES = ['Luxury', 'Economy', 'Electric']
end
