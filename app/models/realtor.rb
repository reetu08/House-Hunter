class Realtor < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :houses, :through => :company

  scope :for_house, lambda { |house_id| joins(:houses, :company).where('houses.id = ?', house_id) }
  scope :for_user_company, lambda { |user_id, company_id| where( 'user_id = ? AND company_id = ?', user_id, company_id )}
end
