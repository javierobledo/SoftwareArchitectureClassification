class CorporaController < ApplicationController
  before_action :set_corpus, only: [:show, :edit, :update, :destroy]

  # GET /corpora
  # GET /corpora.json
  def index
    @corpora = Corpus.all
  end

  # GET /corpora/1
  # GET /corpora/1.json
  def show
  end

  # GET /corpora/new
  def new
    @corpus = Corpus.new
  end

  # GET /corpora/1/edit
  def edit
  end

  # POST /corpora
  # POST /corpora.json
  def create
    @corpus = Corpus.new(corpus_params)

    respond_to do |format|
      if @corpus.save
        format.html { redirect_to @corpus, notice: 'Corpus was successfully created.' }
        format.json { render :show, status: :created, location: @corpus }
      else
        format.html { render :new }
        format.json { render json: @corpus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corpora/1
  # PATCH/PUT /corpora/1.json
  def update
    respond_to do |format|
      if @corpus.update(corpus_params)
        format.html { redirect_to @corpus, notice: 'Corpus was successfully updated.' }
        format.json { render :show, status: :ok, location: @corpus }
      else
        format.html { render :edit }
        format.json { render json: @corpus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corpora/1
  # DELETE /corpora/1.json
  def destroy
    @corpus.destroy
    respond_to do |format|
      format.html { redirect_to corpora_url, notice: 'Corpus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corpus
      @corpus = Corpus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def corpus_params
      params.require(:corpus).permit(:name, :description, :language)
    end
end
