class InquiryPolicy < ApplicationPolicy
  attr_reader :current_user, :inquiry

  def initialize(current_user, inquiry)
    @current_user = current_user
    @inquiry = inquiry
  end

  def index?
    true
  end

  def show?
    @current_user.admin? or @inquiry.user_id == @current_user.id
  end

  def update?
    @current_user.admin? or @inquiry.user_id == @current_user.id
  end

  def destroy?
    @current_user.admin? or @inquiry.user_id == @current_user.id
  end

  def new?
    @current_user.admin? or @inquiry.user_id == @current_user.id
  end

  def create?
    @current_user.admin? or @inquiry.user_id == @current_user.id
  end

  def reply?
    can_send_reply?
  end

  def send_reply?
    can_send_reply?
  end

  private

  def can_send_reply?
    house = House.find @inquiry.house_id

    # The house's user id is the id of the realtor who posted it
    @current_user.admin? or house.user_id = @current_user.id
  end
end