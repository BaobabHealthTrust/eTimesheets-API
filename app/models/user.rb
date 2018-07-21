class User < ApplicationRecord
  has_secure_password
  mattr_accessor :current

  has_one :employee
  has_and_belongs_to_many :roles

  def as_json(options = {})
    super(options.merge(except: [:password_digest], include: {roles: {}, employee: {}}))
  end
end
