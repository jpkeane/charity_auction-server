class Membership < ActiveRecord::Base
  validates :user, presence: true
  validates :organization, presence: true

  belongs_to :user
  belongs_to :organization
end
