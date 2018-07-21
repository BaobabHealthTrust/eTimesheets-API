class User < ApplicationRecord
  has_secure_password
  mattr_accessor :current

  has_many :employees
  has_many :roles, through: :user_role

  def as_json(options = {})
    super(options.merge(except: [:password_digest]))
  end
end
