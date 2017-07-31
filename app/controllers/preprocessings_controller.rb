class PreprocessingsController < ApplicationController
  before_action :set_preprocessing, only: [:show, :edit, :update, :destroy]

  # GET /preprocessings
  # GET /preprocessings.json
  def index
    @preprocessings = Preprocessing.all
  end

  def documents_index_csv id
    file = "#{Rails.root}/public/document_data"
    @documents = Preprocessing.find(id).documents
    attributes = ["title", "year", "category", "content"]
    CSV.open(file, 'w', write_headers: true, headers: attributes) do |writer|
      @documents.each do |document|
        writer << [document.title, document.year, document.category, document.content]
      end
    end
    file
  end

  def from_csv_to_documents filepath, pid
    CSV.foreach(filepath, :headers => true) do |row|
      row[:preprocessing_id] = pid
      Document.create!(row.to_hash)
    end
  end

  # GET /preprocessings/1
  # GET /preprocessings/1.json
  def show
  end

  # GET /preprocessings/new
  def new
    @preprocessing = Preprocessing.new
  end

  # GET /preprocessings/1/edit
  def edit
  end

  # POST /preprocessings
  # POST /preprocessings.json
  def create
    @preprocessing = Preprocessing.new(preprocessing_params)

    respond_to do |format|
      if @preprocessing.save
        # Use algorithm selected in corpus
        @alg = Algorithm.find(@preprocessing.algorithm_id)
        # Export documents from parent preprocessing to csv to public folder
        csvfile = documents_index_csv @preprocessing.parent_id
        # Call python process
        outcsvfile = `python3 lib/assets/main.py "#{csvfile}" #{@alg.name}`
        outcsvfile = outcsvfile.chomp
        # Load CSV files in DB as new documents associated to the current preprocessing
        from_csv_to_documents outcsvfile, @preprocessing.id
        # Get the selected preprocessing from the preprocessing
        #@parent = Preprocessing.find(@preprocessing.parent_id)
        # Get documents from him
        #@documents = @parent.documents
        #p @documents.size
        #i = 0
        #@documents.each do |document|
          #new_title = `python3 lib/assets/main.py "#{document.title}" #{@alg.name}`
          #new_content = `python3 lib/assets/main.py "#{document.content}" #{@alg.name}`
          #Document.create!(:title => new_title, :content => new_content, :preprocessing_id => @preprocessing.id)
          #p new_title
          #p new_content
          #p i
          #i = i + 1
        #end


        format.html { redirect_to @preprocessing, notice: 'Preprocessing was successfully created.' }
        format.json { render :show, status: :created, location: @preprocessing }
      else
        format.html { render :new }
        format.json { render json: @preprocessing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preprocessings/1
  # PATCH/PUT /preprocessings/1.json
  def update
    respond_to do |format|
      if @preprocessing.update(preprocessing_params)
        format.html { redirect_to @preprocessing, notice: 'Preprocessing was successfully updated.' }
        format.json { render :show, status: :ok, location: @preprocessing }
      else
        format.html { render :edit }
        format.json { render json: @preprocessing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preprocessings/1
  # DELETE /preprocessings/1.json
  def destroy
    @preprocessing.destroy
    respond_to do |format|
      format.html { redirect_to preprocessings_url, notice: 'Preprocessing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preprocessing
      @preprocessing = Preprocessing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preprocessing_params
      params.require(:preprocessing).permit(:corpus_id, :algorithm_id, :parent_id)
    end
end
