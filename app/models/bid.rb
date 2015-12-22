class Bid < ActiveRecord::Base
  belongs_to :donation
  belongs_to :bidder, class_name: 'User'

  validates :donation, presence: true
  validates :bidder, presence: true
  validates :amount_dollars, presence: true, numericality: { greater_than: 0 }
  validates :placed_at, presence: true

  validate :_quantity_between_1_and_donation_quantity

  def _quantity_between_1_and_donation_quantity
    return unless quantity && donation.try(:quantity)

    unless 1 <= quantity && quantity <= donation.quantity
      errors.add :quantity, "must be greater than or equal to 1 and less than or equal to #{donation.quantity}"
    end
  end
end
