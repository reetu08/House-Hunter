class InquiryRepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inquiry_reply, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  # GET /inquiry_replies
  # GET /inquiry_replies.json
  def index
    @inquiry_replies = InquiryReply.all
    authorize @inquiry_replies
  end

  # GET /inquiry_replies/1
  # GET /inquiry_replies/1.json
  def show
    authorize @inquiry_reply
  end

  # GET /inquiry_replies/new
  def new
    @inquiry_reply = InquiryReply.new
    @inquiry_reply.inquiry_id = params[:inquiry_id]
    @inquiry_reply.realtor_id = current_user.id

    authorize @inquiry_reply
  end

  # GET /inquiry_replies/new
  def edit
    authorize @inquiry_reply
  end

  # POST /inquiry_replies
  # POST /inquiry_replies.json
  def create
    @inquiry_reply = InquiryReply.new(inquiry_reply_params)
    authorize @inquiry_reply

    respond_to do |format|
      if @inquiry_reply.save
        format.html { redirect_to @inquiry_reply, notice: 'Inquiry reply was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry_reply }
      else
        format.html { render :new }
        format.json { render json: @inquiry_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inquiry_replies
  # PUT /inquiry_replies.json
  def update
    authorize @inquiry_reply

    @inquiry_reply.message = params[:inquiry_reply][:message]

    respond_to do |format|
      if @inquiry_reply.save
        format.html { redirect_to @inquiry_reply, notice: 'Inquiry reply was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry_reply }
      else
        format.html { render :new }
        format.json { render json: @inquiry_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiry_replies/1
  # DELETE /inquiry_replies/1.json
  def destroy
    authorize @inquiry_reply

    @inquiry_reply.destroy

    respond_to do |format|
      format.html { redirect_to inquiries_path, notice: 'Inquiry reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry_reply
      @inquiry_reply = InquiryReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_reply_params
      params.require(:inquiry_reply).permit([:inquiry_id, :realtor_id, :message])
    end
end
