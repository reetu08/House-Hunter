class User < ApplicationRecord
  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    roles.each do |role|
      return true if role.name == 'ADMIN'
    end
  end

  def househunter?
    roles.each do |role|
      return true if role.name == 'HOUSE-HUNTER'
    end
  end

  def realtor?
    roles.each do |role|
      return true if role.name == 'REALTOR'
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
