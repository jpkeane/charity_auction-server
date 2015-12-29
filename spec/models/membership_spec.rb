RSpec.describe Membership, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :organization }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :organization }
  end
end
