################################################################################
# Model:  User
#
# Purpose:  A Company User with access to Admin
#
# User attributes:
#   role              - enum { manager (0) | admin (1) | superadmin (2)}
#   last_name         - string:
#   first_name         - string:
#   email             - string,   not NULL, unique
#   password_digest   - password: string, not NULL
#   remember_token    - string
#   status            - enum { active (0) | archived (1) }
#
#   13.01.2022 ZT    Adopted for RoR 7 (from Rails 6 zt_admin)
################################################################################
class User < ApplicationRecord
  include Emailable

  enum role:   %w(manager admin superadmin)
  enum status: %w(active archived)

  # Error (nopt fixed):
  #   You tried to define an enum named "role" on the model "User", 
  #   but this will generate a instance method "manager?", 
  #   which is already defined by another enum. (ArgumentError)

  # enum role:   {manager: 1, admin: 1, superadmin: 2}
  # enum status: {active: 0, archived: 1}, default: :active

  validates :last_name, presence: true
  validates :first_name, presence: true

  has_secure_password  # validates presence of password & password_confirmation
  validates :password, length: {minimum: 8}

  # Returns an User full name
  def full_name
    "#{last_name} #{first_name}"
  end

  private

    # Returns a random token
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    # Returns a random token.
    def User.new_token
      SecureRandom.urlsafe_base64
    end

    # Remembers a user in the database to apply him/her in persistent sessions
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
