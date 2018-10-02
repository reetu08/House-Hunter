class Realtor < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :houses, :through => :company

  scope :for_house, lambda { |house_id| joins(:houses, :company).where('houses.id = ?', house_id) }
end
