class Auction < ActiveRecord::Base

  validate :_starts_at_after_donation_window_ends_at
  validate :_ends_at_after_starts_at
  validates :time_zone_id, inclusion: { in: ActiveSupport::TimeZone.all.map { |tz| tz.tzinfo.identifier } }, allow_blank: true
  validates :organization, presence: true

  has_many :auction_admins
  has_many :donations
  belongs_to :organization

  def _ends_at_after_starts_at
    return unless starts_at && ends_at

    if ends_at <= starts_at then
      errors.add :ends_at, 'must be greater than starts_at'
    end
  end

  def _starts_at_after_donation_window_ends_at
    return unless starts_at && donation_window_ends_at

    if starts_at <= donation_window_ends_at then
      errors.add :starts_at, 'must be greater than donation_window_ends_at'
    end
  end
end
