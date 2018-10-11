class CompanyPolicy < ApplicationPolicy
  attr_reader :current_user, :company

  def initialize(current_user, company)
    @current_user = current_user
    @company = company
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @current_user.admin? or @current_user.realtor?
  end

  def destroy?
    @current_user.admin?
  end

  def new?
    re = Realtor.find_by_user_id @current_user.id
    @current_user.admin? or (@current_user.realtor? and  re.nil?)
  end

  def create?
    re = Realtor.find_by_user_id @current_user.id
    @current_user.admin? or (@current_user.realtor? and re.nil?)
  end

  def join?
    re = Realtor.find_by_user_id @current_user.id
    @current_user.admin? or (@current_user.realtor? and re.nil?)
  end

  def leave?
    @current_user.admin? or @current_user.realtor?
  end
end
