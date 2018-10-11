# frozen_string_literal: true

class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]
  after_action :verify_authorized

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    authorize @companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    authorize @company
  end

  # GET /companies/new
  def new
    @company = Company.new
    authorize @company
  end

  # GET /companies/1/edit
  def edit
    authorize @company
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    authorize @company

    respond_to do |format|
      if @company.save
        if current_user.realtor?
          r = Realtor.new
          r.user_id = current_user.id
          r.company_id = @company.id
          r.is_owner = true
          r.save
        end
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    authorize @company

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    authorize @company

    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @company = Company.find params[:id]
    authorize @company
      r = Realtor.new
      if !r.is_owner
        r.company_id = @company.id
        r.user_id = current_user.id
        r.save
      end
    redirect_to @company
  end 

  def leave
    @company = Company.find params[:id]
    authorize @company
    r = Realtor.for_user_company(current_user.id, @company.id).first
    r.destroy
    redirect_to @company
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :website, :addr, :size, :found_year, :revenue, :synopsis)
    end
end
