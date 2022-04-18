class DetailSet < ApplicationRecord
  belongs_to :detailable, polymorphic: true

  validates :detailable,  presence: true
  validates :inn, presence: true, uniqueness: true
  validates :kpp, uniqueness: true, allow_nil: true

    # Use :to_global_id to populate the form
    def detailable_gid
      detailable&.to_global_id
    end
    
    # Set the :detailable from a Global ID (handles the form submission)
    def detailable_gid=(gid)
      self.detailable = GlobalID::Locator.locate gid
    end
end
