class Company < ApplicationRecord
  has_many :realtors

  def owned_by
    owning_realtor = realtors.each.select { |realtor| realtor.is_owner == true }
    if (owning_realtor.size == 0)
      return 'No Owner Yet'
    end
    owning_realtor = owning_realtor[0]
    owning_user = User.find_by_id owning_realtor.user_id
    owning_user.name
  end
end
