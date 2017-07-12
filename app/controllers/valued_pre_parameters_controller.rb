class ValuedPreParametersController < ApplicationController
  before_action :set_valued_pre_parameter, only: [:show, :edit, :update, :destroy]

  # GET /valued_pre_parameters
  # GET /valued_pre_parameters.json
  def index
    @valued_pre_parameters = ValuedPreParameter.all
  end

  # GET /valued_pre_parameters/1
  # GET /valued_pre_parameters/1.json
  def show
  end

  # GET /valued_pre_parameters/new
  def new
    @valued_pre_parameter = ValuedPreParameter.new
  end

  # GET /valued_pre_parameters/1/edit
  def edit
  end

  # POST /valued_pre_parameters
  # POST /valued_pre_parameters.json
  def create
    @valued_pre_parameter = ValuedPreParameter.new(valued_pre_parameter_params)

    respond_to do |format|
      if @valued_pre_parameter.save
        format.html { redirect_to @valued_pre_parameter, notice: 'Valued pre parameter was successfully created.' }
        format.json { render :show, status: :created, location: @valued_pre_parameter }
      else
        format.html { render :new }
        format.json { render json: @valued_pre_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valued_pre_parameters/1
  # PATCH/PUT /valued_pre_parameters/1.json
  def update
    respond_to do |format|
      if @valued_pre_parameter.update(valued_pre_parameter_params)
        format.html { redirect_to @valued_pre_parameter, notice: 'Valued pre parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @valued_pre_parameter }
      else
        format.html { render :edit }
        format.json { render json: @valued_pre_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valued_pre_parameters/1
  # DELETE /valued_pre_parameters/1.json
  def destroy
    @valued_pre_parameter.destroy
    respond_to do |format|
      format.html { redirect_to valued_pre_parameters_url, notice: 'Valued pre parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valued_pre_parameter
      @valued_pre_parameter = ValuedPreParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valued_pre_parameter_params
      params.require(:valued_pre_parameter).permit(:value, :parameter_id, :preprocessing_id)
    end
end
