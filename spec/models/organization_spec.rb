RSpec.describe Organization, type: :model do
  describe 'attributes' do
    it { is_expected.to have_attribute :name }
  end

  describe 'relationships' do
    it { is_expected.to have_many :auctions }
    it { is_expected.to have_many :memberships }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
