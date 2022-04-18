class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum kind:   %w(actual legal delivery)
  enum status: %w(active archived)

  validates :addressable,  presence: true
  validates :postal_code,  format: {with: /\A[\d+]{6}\Z/, message: 'must be 6 digits'}
  validates :country,      presence: true
  validates :region,       presence: true
  validates :city,         presence: true
  validates :street,       presence: true

  # Use :to_global_id to populate the form
  def addressable_gid
    addressable&.to_global_id
  end
  
  # Set the :addressable from a Global ID (handles the form submission)
  def addressable_gid=(gid)
    self.addressable = GlobalID::Locator.locate gid
  end

  def full_address
    full = ''
    full << postal_code if postal_code.present?
    full << " #{country},"
    full << " #{region}," if region != city
    full << " #{city},"
    full << " #{street}"
    full
  end
end