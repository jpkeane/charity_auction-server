class Donation < ActiveRecord::Base
  belongs_to :auction
  belongs_to :bid_type
  belongs_to :donor, class_name: 'User'

  validates :donor, presence: true
  validates :auction, presence: true

  validates :quantity, numericality: { greater_than: 0 }, allow_nil: true
  validates :estimated_value_dollars, numericality: { greater_than: 0 }, allow_nil: true
  validates :minimum_bid_dollars, numericality: { greater_than: 0 }, allow_nil: true

  validate :_redemption_window_ends_at_greater_than_redemption_window_starts_at

  enum fulfillment_type: [:item, :certificate]

  def _redemption_window_ends_at_greater_than_redemption_window_starts_at
    return unless redemption_window_ends_at && redemption_window_starts_at

    if redemption_window_ends_at <= redemption_window_starts_at
      errors.add :redemption_window_ends_at, 'must be greater than redemption_window_starts_at'
    end
  end
end
