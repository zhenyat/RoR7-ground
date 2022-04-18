class Email < ApplicationRecord
  belongs_to :emailable, polymorphic: true

  before_save {self.address.downcase!}

  enum kind:   %w(work home other)
  enum status: %w(active archived)

  validates :emailable,  presence: true
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :address, presence: true, format: {with: valid_email_regex}, uniqueness: {case_sensitive: false}
end
