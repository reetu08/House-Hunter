class RealtorPolicy < ApplicationPolicy
  attr_reader :current_user, :realtor

  def initialize(current_user, realtor)
    @current_user = current_user
    @realtor = realtor
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @current_user.admin? or @current_user.id == @realtor.user_id
  end

  def destroy?
    @current_user.admin? or @current_user.id == @realtor.user_id
  end

  def new?
    @current_user.admin? or (@current_user.realtor? && @current_user.realtor.nil?)
  end

  def create?
    @current_user.admin? or (@current_user.realtor? && @current_user.realtor.nil?)
  end

end