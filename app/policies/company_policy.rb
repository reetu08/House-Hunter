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
    @current_user.admin? or @current_user.realtor?
  end

  def create?
    @current_user.admin? or @current_user.realtor?
  end

  def join?
    @current_user.admin? or @current_user.realtor?
  end

end
