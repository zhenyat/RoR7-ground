class Partner < ApplicationRecord
  has_many :addresses,   as: :addressable
  has_many :detail_sets, as: :detailable
  has_many :emails,      as: :emailable
  has_many :phones,      as: :phoneable, dependent: :delete_all

  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :detail_sets
  accepts_nested_attributes_for :emails
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  
  enum kind:   %w(zao individual oao ooo pao) #%w(ЗАО ИП ОАО ООО ПАО)
  enum role:   %w(supplier market_place service_provider subcontractor)
  enum status: %w(active archived)

  validates_associated :addresses
  validates_associated :detail_sets
  validates_associated :emails
  validates_associated :phones
end
