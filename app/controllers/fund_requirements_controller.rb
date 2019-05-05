class FundRequirementsController < ApplicationController
  before_action :set_fund_requirement, only: [:show, :edit, :update, :destroy]

  # GET /fund_requirements
  # GET /fund_requirements.json
  def index
    @fund_requirements = []
    isInvestor = User.find(current_user.id).investor_status

    if isInvestor
      FundRequirement.all.each do |fr|
        if fr.lender_id == current_user.id && fr.active
          @fund_requirements.push(fr)
        end
      end

    end
  end

  # GET /fund_requirements/1
  # GET /fund_requirements/1.json
  def show
  end

  # GET /fund_requirements/new
  def new
    @fund_requirement = FundRequirement.new
  end

  # GET /fund_requirements/1/edit
  def edit
  end

  # POST /fund_requirements
  # POST /fund_requirements.json
  def create
    @fund_requirement = FundRequirement.new(fund_requirement_params)

    respond_to do |format|
      if @fund_requirement.save
        format.html { redirect_to @fund_requirement, notice: 'Fund requirement was successfully created.' }
        format.json { render :show, status: :created, location: @fund_requirement }
      else
        format.html { render :new }
        format.json { render json: @fund_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fund_requirements/1
  # PATCH/PUT /fund_requirements/1.json
  def update
    respond_to do |format|
      if @fund_requirement.update(fund_requirement_params)
        format.html { redirect_to @fund_requirement, notice: 'Fund requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @fund_requirement }
      else
        format.html { render :edit }
        format.json { render json: @fund_requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  def deactivate
    @fund_requirement.active = false
    @fund_requirement.save!
  end

  # DELETE /fund_requirements/1
  # DELETE /fund_requirements/1.json
  def destroy
    @fund_requirement.destroy
    respond_to do |format|
      format.html { redirect_to fund_requirements_url, notice: 'Fund requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fund_requirement
      @fund_requirement = FundRequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fund_requirement_params
      params.require(:fund_requirement).permit(:amount, :rate, :length)
    end
end
