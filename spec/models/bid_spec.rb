RSpec.describe Bid, type: :model do
  describe 'attributes' do
    %w(
      quantity
      amount_dollars
      placed_at
    ).each do |attr|
      it { is_expected.to have_attribute attr}
    end
  end

  describe 'relationships' do
    it { is_expected.to belong_to :donation }
    it { is_expected.to belong_to :bidder }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :donation }
    it { is_expected.to validate_presence_of :bidder }
    it { is_expected.to validate_presence_of :amount_dollars }
    it { is_expected.to validate_presence_of :quantity }
    it { is_expected.to validate_presence_of :placed_at }

    it { is_expected.to validate_numericality_of(:amount_dollars).is_greater_than(0) }

    it 'validates that the quantity is between 1 and the donation quantity' do
      subject.donation = Donation.new(quantity: 3)
      subject.quantity = 0
      subject.valid?
      expect(subject.errors[:quantity]).to include 'must be greater than or equal to 1 and less than or equal to 3'
    end
  end
end
