class WordFrequenciesController < ApplicationController
  before_action :set_word_frequency, only: [:show, :edit, :update, :destroy]

  # GET /word_frequencies
  # GET /word_frequencies.json
  def index
    @word_frequencies = WordFrequency.all
  end

  # GET /word_frequencies/1
  # GET /word_frequencies/1.json
  def show
  end

  # GET /word_frequencies/new
  def new
    @word_frequency = WordFrequency.new
  end

  # GET /word_frequencies/1/edit
  def edit
  end

  # POST /word_frequencies
  # POST /word_frequencies.json
  def create
    @word_frequency = WordFrequency.new(word_frequency_params)

    respond_to do |format|
      if @word_frequency.save
        format.html { redirect_to @word_frequency, notice: 'Word frequency was successfully created.' }
        format.json { render :show, status: :created, location: @word_frequency }
      else
        format.html { render :new }
        format.json { render json: @word_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_frequencies/1
  # PATCH/PUT /word_frequencies/1.json
  def update
    respond_to do |format|
      if @word_frequency.update(word_frequency_params)
        format.html { redirect_to @word_frequency, notice: 'Word frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_frequency }
      else
        format.html { render :edit }
        format.json { render json: @word_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_frequencies/1
  # DELETE /word_frequencies/1.json
  def destroy
    @word_frequency.destroy
    respond_to do |format|
      format.html { redirect_to word_frequencies_url, notice: 'Word frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_frequency
      @word_frequency = WordFrequency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_frequency_params
      params.require(:word_frequency).permit(:content, :frequency, :cluster_id)
    end
end
