class Listing < ApplicationRecord
  belongs_to :host
  has_many_attached :photos

  has_many :bookings

  scope :is_available, -> {where(available: true)}
end
