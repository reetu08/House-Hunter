class InquiryReplyPolicy < ApplicationPolicy
  attr_reader :current_user, :inquiry_reply

  def initialize(current_user, inquiry_reply)
    @current_user = current_user
    @inquiry_reply = inquiry_reply
  end

  def index?
    true
  end

  def show?
    if @current_user.admin? or @inquiry_reply.realtor_id == @current_user.id
      true
    end

    inquiry = Inquiry.find @inquiry_reply.inquiry_id
    inquiry.user_id == @current_user.id
  end

  def new?
    if @current_user.admin?
      true
    end

    can_send_reply?
  end

  def create?
    if @current_user.admin?
      true
    end

    can_send_reply?
  end

  private

  def can_send_reply?
    inquiry = Inquiry.find @inquiry_reply.inquiry_id
    house = House.find inquiry.house_id

    # The house's user id is the id of the realtor who posted it
    @current_user.admin? or house.user_id = @current_user.id
  end
end