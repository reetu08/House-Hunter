class HousePolicy < ApplicationPolicy
  attr_reader :current_user, :house

  def initialize(current_user, house)
    @current_user = current_user
    @house = house
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @current_user.admin? or @current_user.id == @house.user_id
  end

  def destroy?
    @current_user.admin? or @current_user.id == @house.user_id
  end

  def new?
    @current_user.admin? or (@current_user.realtor? && !@current_user.realtor.nil?)
  end

  def create?
    @current_user.admin? or (@current_user.realtor? && !@current_user.realtor.nil?)
  end

end
