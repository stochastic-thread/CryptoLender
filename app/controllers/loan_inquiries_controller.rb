class LoanInquiriesController < ApplicationController
  before_action :set_loan_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /loan_inquiries
  # GET /loan_inquiries.json
  def index
    @loan_inquiries = []
    LoanInquiry.all.each do |li|
      if li.
      @loan_inquiries.push()
    end



  end

  # GET /loan_inquiries/1
  # GET /loan_inquiries/1.json
  def show
  end

  # GET /loan_inquiries/new
  def new
    @loan_inquiry = LoanInquiry.new
  end

  # GET /loan_inquiries/1/edit
  def edit
  end

  # POST /loan_inquiries
  # POST /loan_inquiries.json
  def create
    @loan_inquiry = LoanInquiry.new(loan_inquiry_params)

    respond_to do |format|
      if @loan_inquiry.save
        format.html { redirect_to @loan_inquiry, notice: 'Loan inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @loan_inquiry }
      else
        format.html { render :new }
        format.json { render json: @loan_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_inquiries/1
  # PATCH/PUT /loan_inquiries/1.json
  def update
    respond_to do |format|
      if @loan_inquiry.update(loan_inquiry_params)
        format.html { redirect_to @loan_inquiry, notice: 'Loan inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_inquiry }
      else
        format.html { render :edit }
        format.json { render json: @loan_inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_inquiries/1
  # DELETE /loan_inquiries/1.json
  def destroy
    @loan_inquiry.destroy
    respond_to do |format|
      format.html { redirect_to loan_inquiries_url, notice: 'Loan inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_inquiry
      @loan_inquiry = LoanInquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_inquiry_params
      params.require(:loan_inquiry).permit(:amount, :rate, :length)
    end
end
