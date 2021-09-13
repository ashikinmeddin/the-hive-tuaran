class Listing < ApplicationRecord
  belongs_to :host
  has_many_attached :photos

  scope :is_available, -> {where(available: true)}
end
