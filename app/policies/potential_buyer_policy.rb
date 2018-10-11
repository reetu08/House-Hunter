class PotentialBuyerPolicy < ApplicationPolicy
  attr_reader :user_id, :house_id

  def initialize(user_id, house_id)
    @user_id = user_id
    @house_id = house_id
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    true
  end
end
