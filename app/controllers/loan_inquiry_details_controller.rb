class LoanInquiryDetailsController < ApplicationController
  before_action :set_loan_inquiry_detail, only: [:show, :edit, :update, :destroy]

  # GET /loan_inquiry_details
  # GET /loan_inquiry_details.json
  def index
    @loan_inquiry_details = LoanInquiryDetail.all
  end

  # GET /loan_inquiry_details/1
  # GET /loan_inquiry_details/1.json
  def show
  end

  # GET /loan_inquiry_details/new
  def new
    @loan_inquiry_detail = LoanInquiryDetail.new
  end

  # GET /loan_inquiry_details/1/edit
  def edit
  end

  # POST /loan_inquiry_details
  # POST /loan_inquiry_details.json
  def create
    @loan_inquiry_detail = LoanInquiryDetail.new(loan_inquiry_detail_params)

    respond_to do |format|
      if @loan_inquiry_detail.save
        format.html { redirect_to @loan_inquiry_detail, notice: 'Loan inquiry detail was successfully created.' }
        format.json { render :show, status: :created, location: @loan_inquiry_detail }
      else
        format.html { render :new }
        format.json { render json: @loan_inquiry_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_inquiry_details/1
  # PATCH/PUT /loan_inquiry_details/1.json
  def update
    respond_to do |format|
      if @loan_inquiry_detail.update(loan_inquiry_detail_params)
        format.html { redirect_to @loan_inquiry_detail, notice: 'Loan inquiry detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_inquiry_detail }
      else
        format.html { render :edit }
        format.json { render json: @loan_inquiry_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_inquiry_details/1
  # DELETE /loan_inquiry_details/1.json
  def destroy
    @loan_inquiry_detail.destroy
    respond_to do |format|
      format.html { redirect_to loan_inquiry_details_url, notice: 'Loan inquiry detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_inquiry_detail
      @loan_inquiry_detail = LoanInquiryDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_inquiry_detail_params
      params.require(:loan_inquiry_detail).permit(:project_name, :damage_type, :organization_type, :damaged_address, :city, :state, :insured, :revenue, :estimated_loss, :headcount, :industry, :date_established, :previous_bankruptcy, :bankruptcy_count, :mailing_address)
    end
end
