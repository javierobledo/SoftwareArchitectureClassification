class ClusterDocumentsController < ApplicationController
  before_action :set_cluster_document, only: [:show, :edit, :update, :destroy]

  # GET /cluster_documents
  # GET /cluster_documents.json
  def index
    @cluster_documents = ClusterDocument.all
  end

  # GET /cluster_documents/1
  # GET /cluster_documents/1.json
  def show
  end

  # GET /cluster_documents/new
  def new
    @cluster_document = ClusterDocument.new
  end

  # GET /cluster_documents/1/edit
  def edit
  end

  # POST /cluster_documents
  # POST /cluster_documents.json
  def create
    @cluster_document = ClusterDocument.new(cluster_document_params)

    respond_to do |format|
      if @cluster_document.save
        format.html { redirect_to @cluster_document, notice: 'Cluster document was successfully created.' }
        format.json { render :show, status: :created, location: @cluster_document }
      else
        format.html { render :new }
        format.json { render json: @cluster_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cluster_documents/1
  # PATCH/PUT /cluster_documents/1.json
  def update
    respond_to do |format|
      if @cluster_document.update(cluster_document_params)
        format.html { redirect_to @cluster_document, notice: 'Cluster document was successfully updated.' }
        format.json { render :show, status: :ok, location: @cluster_document }
      else
        format.html { render :edit }
        format.json { render json: @cluster_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cluster_documents/1
  # DELETE /cluster_documents/1.json
  def destroy
    @cluster_document.destroy
    respond_to do |format|
      format.html { redirect_to cluster_documents_url, notice: 'Cluster document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster_document
      @cluster_document = ClusterDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cluster_document_params
      params.require(:cluster_document).permit(:cluster_id, :document_id)
    end
end
