RSpec.describe BidType, type: :model do
  describe 'attributes' do
    it { is_expected.to have_attribute :name }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :name}
  end
end
