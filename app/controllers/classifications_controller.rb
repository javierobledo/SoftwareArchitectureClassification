class ClassificationsController < ApplicationController
  before_action :set_classification, only: [:show, :edit, :update, :destroy]

  # GET /classifications
  # GET /classifications.json
  def index
    @classifications = Classification.all
  end

  # GET /classifications/1
  # GET /classifications/1.json
  def show
    @root = @classification.get_clusters_root
    if @root != nil
      render json: @root.to_node3
    else
      render :show
    end
  end

  def graph
    render 'graphs/index'
  end

  # GET /classifications/new
  def new
    @classification = Classification.new
  end

  # GET /classifications/1/edit
  def edit
  end

  def do_classification
    render json:{'p'=>params.keys}
  end

  # POST /classifications
  # POST /classifications.json
  def create
    @classification = Classification.new(classification_params)
    respond_to do |format|
      if @classification.save
        @classification.algorithm.parameters.each do |parameter|
          ValuedClaParameter.create!({:value=>parameter.default,:classification_id=>@classification.id,:parameter_id=>parameter.id})
        end
        format.html { redirect_to @classification, notice: 'Classification was successfully created.' }
        format.json { render :show, status: :created, location: @classification }
      else
        format.html { render :new }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classifications/1
  # PATCH/PUT /classifications/1.json
  def update
    #render json:{'clas' => params[:action],'classification'=> params[:classification],'commit'=>params[:commit],'id'=>params[:id],'_method'=>params[:_method],'action'=>params[:action],'keys' => params.keys}
    respond_to do |format|
      if @classification.update(classification_params)
        @values = params[:classification][:valued_cla_parameters_attributes]
        @values.each do |n,data|
          ValuedClaParameter.update data[:id],{:value=>data[:value]}
        end
        format.html { redirect_to @classification, notice: 'Classification was successfully updated.' }
        format.json { render :show, status: :ok, location: @classification }
      else
        format.html { render :edit }
        format.json { render json: @classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classifications/1
  # DELETE /classifications/1.json
  def destroy
    @classification.destroy
    respond_to do |format|
      format.html { redirect_to classifications_url, notice: 'Classification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification
      @classification = Classification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_params
      params.require(:classification).permit(:name, :algorithm_id, :preprocessing_id, valued_cla_parameters_attributes: [ :parameter_id ])
    end
end
