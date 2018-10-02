class InquiriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized


  # GET /inquiries
  # GET /inquiries.json
  def index
    authorize Inquiry.all

    @sent_inquiries = Inquiry.where(:user_id => current_user.id).all

    if (params[:house_id].nil?)
      @received_inquiries = Inquiry.for_realtor(current_user.id).all
    else
      @received_inquiries = Inquiry.for_house(params[:house_id]).all
    end

  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
    authorize @inquiry
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new

    @inquiry.house_id = params[:house_id]
    @inquiry.user_id = current_user.id
    authorize @inquiry
  end

  # GET /inquiries/1/edit
  def edit
    authorize @inquiry
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    authorize @inquiry

    respond_to do |format|
      if @inquiry.save
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    authorize @inquiry

    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    authorize @inquiry

    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:house_id, :user_id, :subject, :message)
    end
end
