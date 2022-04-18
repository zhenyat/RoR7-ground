class Bank < ApplicationRecord
  has_many :phones, as: :phoneable, dependent: :delete_all

  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates_associated :phones

end
