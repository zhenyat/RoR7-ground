class Phone < ApplicationRecord
  belongs_to :phoneable, polymorphic: true, required: true

  enum kind:   %w(mobile work fax home )
  enum status: %w(active archived)
  
  validates :phoneable,         presence: true
  validates :country_code,      presence: true
  validates :destination_code,  presence: true, format: {with: /\A[\d+]{3}\Z/, message: 'must be 3 digits'}
  validates :subscriber_number, presence: true, format: {with: /\A[\d+]{7}\Z/, message: 'must be 7 digits'}

  # Use :to_global_id to populate the form
  def phoneable_gid
    phoneable&.to_global_id
  end
  
  # Set the :phoneable from a Global ID (handles the form submission)
  def phoneable_gid=(gid)
    self.phoneable = GlobalID::Locator.locate gid
  end

  def full_number
    "+#{country_code}(#{destination_code})#{subscriber_number.first(3)}-#{subscriber_number.last(4)}"
  end
end
