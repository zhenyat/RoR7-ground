class Person < ApplicationRecord
  has_rich_text :content
  validates :name, presence: true
  enum role: %w(admin user manager)
end
