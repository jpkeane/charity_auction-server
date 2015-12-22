RSpec.describe Donation, type: :model do
  describe 'attributes' do
    %w(
      title
      description
      quantity
      redemption_window_starts_at
      redemption_window_ends_at
      estimated_value_dollars
      minimum_bid_dollars
      display_description
      admin_follow_up_needed
      fulfillment_type
    ).each do |attr|
      it { is_expected.to have_attribute attr}
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :auction }
    it { is_expected.to belong_to :bid_type }
    it { is_expected.to belong_to :donor }
    it { is_expected.to have_many :bids }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :auction }
    it { is_expected.to validate_presence_of :donor }

    it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0).allow_nil }

    it 'validates that redemption_window_ends_at is after redemption_window_starts_at' do
      subject.redemption_window_starts_at = DateTime.new(2015, 12, 20, 00, 00)
      subject.redemption_window_ends_at = subject.redemption_window_starts_at
      subject.valid?
      expect(subject.errors[:redemption_window_ends_at]).to include 'must be greater than redemption_window_starts_at'
      subject.redemption_window_ends_at = subject.redemption_window_starts_at.advance(seconds: 1)
      subject.valid?
      expect(subject.errors[:redemption_window_ends_at]).to be_empty
    end

    it { is_expected.to validate_numericality_of(:estimated_value_dollars).is_greater_than(0).allow_nil }
    it { is_expected.to validate_numericality_of(:minimum_bid_dollars).is_greater_than(0).allow_nil }

    it 'defaults admin_follow_up_needed to false' do
      expect(subject.admin_follow_up_needed).to eq false
    end

    it 'has the fulfillment_type enum definition' do
      expect(described_class.fulfillment_types).to eq({
          'item' => 0,
          'certificate' => 1
      })
    end

    it 'has a nil fulfillment type by default' do
      expect(subject.fulfillment_type).to eq nil
    end
  end
end
