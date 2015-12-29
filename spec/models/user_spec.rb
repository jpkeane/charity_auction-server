RSpec.describe User, type: :model do
  attr_list = %w(name mobile_phone_number email_address physical_address)
  describe 'attributes' do
    attr_list.each do |attr|
      it { is_expected.to have_attribute attr }
    end
  end

  describe 'relationships' do
    it { is_expected.to have_many :auction_admins }
    it { is_expected.to have_many :donations }
  end

  describe 'validations' do
    attr_list.each do |req_attr|
      it { is_expected.to validate_presence_of req_attr }
    end

    it 'validates uniqueness of mobile_phone_number' do
      original = FactoryGirl.create(:user)
      duplicate = FactoryGirl.build(:user, mobile_phone_number: original.mobile_phone_number)
      duplicate.valid?
      expect(duplicate.errors[:mobile_phone_number]).to include 'has already been taken'
    end

    it 'validates uniqueness of email_address' do
      original = FactoryGirl.create(:user)
      duplicate = FactoryGirl.build(:user, email_address: original.email_address)
      duplicate.valid?
      expect(duplicate.errors[:email_address]).to include 'has already been taken'
    end
  end
end
