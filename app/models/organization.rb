class Organization < ActiveRecord::Base
  validates :name, presence: true

  has_many :auctions
  has_many :memberships
end
