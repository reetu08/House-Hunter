class Role < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles

  def self.user_roles
    Role.all.reject { |role| role.name == 'ADMIN' }
  end
end
