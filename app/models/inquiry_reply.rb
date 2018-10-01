class InquiryReply < ApplicationRecord
  belongs_to :user, foreign_key: :realtor_id
  belongs_to :inquiry
end
