class ExternalUID < ApplicationRecord
  belongs_to :user

  validates :uid, :uniqueness => true, :presence => true
end
