class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  delegate :host, to: :listing

  enum status: [:pending, :paid, :cancelled]

  after_create :generate_ref_no
  after_create :calculate_total

  def generate_ref_no
    #y7w40p
    random_string = SecureRandom.hex(3)
    self.ref_no = random_string
    self.save
  end

  def calculate_total
    self.total = listing.price_per_item * listing.quantity
    self.save
  end
end
