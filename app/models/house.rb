class House < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :potential_buyers

end
