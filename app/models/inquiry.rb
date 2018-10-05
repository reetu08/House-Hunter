class Inquiry < ApplicationRecord
  belongs_to :house
  belongs_to :user
  has_one :inquiry_reply, :dependent => :delete

  validates :subject, presence: true, allow_blank: false, length: { maximum: 40 }
  validates :message, presence: true, allow_blank: false, length: { maximum: 250 }

  scope :for_realtor, lambda {|user_id| joins(:house).where('houses.user_id = ?', user_id)}
  scope :for_house, lambda {|house_id| joins(:house).where('houses.id = ?', house_id)}

end
