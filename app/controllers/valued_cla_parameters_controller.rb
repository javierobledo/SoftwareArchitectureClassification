class ValuedClaParametersController < ApplicationController
  before_action :set_valued_cla_parameter, only: [:show, :edit, :update, :destroy]

  # GET /valued_cla_parameters
  # GET /valued_cla_parameters.json
  def index
    @valued_cla_parameters = ValuedClaParameter.all
  end

  # GET /valued_cla_parameters/1
  # GET /valued_cla_parameters/1.json
  def show
  end

  # GET /valued_cla_parameters/new
  def new
    if params.has_key? :parameter_id
      @parameter = Parameter.find(params[:parameter_id])
      @valued_cla_parameter = {:newvalued=>ValuedClaParameter.new,:parameter_id=>@parameter.id,:classification_id=>params[:classification_id],:default=>@parameter.default}
    else
      @valued_cla_parameter = ValuedClaParameter.new
    end
  end

  # GET /valued_cla_parameters/1/edit
  def edit
  end

  # POST /valued_cla_parameters
  # POST /valued_cla_parameters.json
  def create
    @valued_cla_parameter = ValuedClaParameter.new(valued_cla_parameter_params)

    respond_to do |format|
      if @valued_cla_parameter.save
        format.html { redirect_to @valued_cla_parameter, notice: 'Valued cla parameter was successfully created.' }
        format.json { render :show, status: :created, location: @valued_cla_parameter }
      else
        format.html { render :new }
        format.json { render json: @valued_cla_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valued_cla_parameters/1
  # PATCH/PUT /valued_cla_parameters/1.json
  def update
    respond_to do |format|
      if @valued_cla_parameter.update(valued_cla_parameter_params)
        format.html { redirect_to @valued_cla_parameter, notice: 'Valued cla parameter was successfully updated.' }
        format.json { render :show, status: :ok, location: @valued_cla_parameter }
      else
        format.html { render :edit }
        format.json { render json: @valued_cla_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valued_cla_parameters/1
  # DELETE /valued_cla_parameters/1.json
  def destroy
    @valued_cla_parameter.destroy
    respond_to do |format|
      format.html { redirect_to valued_cla_parameters_url, notice: 'Valued cla parameter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valued_cla_parameter
      @valued_cla_parameter = ValuedClaParameter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valued_cla_parameter_params
      params.require(:valued_cla_parameter).permit(:value, :parameter_id, :classification_id)
    end
end
