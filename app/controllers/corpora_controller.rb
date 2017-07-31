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
  require 'zip'
  def create
    @corpus = Corpus.new(corpus_params)

    respond_to do |format|
      if @corpus.save
        # This read the content of the file chooser to a variable
        uploaded_io = params[:corpus][:corpus_file]
        # This stores the content of the file in another, with the same name, in public/uploads
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        filepath = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
        @alg = Algorithm.find_by_name('Original')
        @preprocessing = Preprocessing.new(:corpus_id => @corpus.id, :algorithm_id => @alg.id)
        if @preprocessing.save
          Zip::File.open(filepath) do |zip_file|
            zip_file.each do |entry|
              if entry.file?
                content = entry.get_input_stream.read.split("\n")
                if content.size == 2
                  title = content[0]
                  text = content[1]
                  Document.create!(:title => title, :content => text, :preprocessing_id => @preprocessing.id)

                end
              end
            end
          end

        end

        # Read first two lines of a text file, and stores it into an array
        # lines = File.foreach(filepath).first(2)
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
      params.require(:corpus).permit(:name, :description, :language, :corpus_file)
    end
end
