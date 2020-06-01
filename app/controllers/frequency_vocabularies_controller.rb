class FrequencyVocabulariesController < ApplicationController
  before_action :set_frequency_vocabulary, only: [:show, :edit, :update, :destroy]

  # GET /frequency_vocabularies
  # GET /frequency_vocabularies.json
  def index
    @frequency_vocabularies = FrequencyVocabulary.all
  end

  # GET /frequency_vocabularies/1
  # GET /frequency_vocabularies/1.json
  def show
    @pagy, @freq_voc_words = pagy(FreqVocWord.all)
  end

  # GET /frequency_vocabularies/new
  def new
    @frequency_vocabulary = FrequencyVocabulary.new
  end

  # GET /frequency_vocabularies/1/edit
  def edit
  end

  # POST /frequency_vocabularies
  # POST /frequency_vocabularies.json
  def create
    # log = Logger.new('log/my.log')
    @frequency_vocabulary = FrequencyVocabulary.new(frequency_vocabulary_params)
    tmp = params[:frequency_vocabulary][:file].tempfile.read.force_encoding("windows-1251").encode("utf-8")
    #log.debug("#{tmp.truncate(500)}")
    array = tmp.split("\r")
    array.each do |x|
      tmp = x.split("\t")
      fvw = @frequency_vocabulary.freq_voc_words.build(word: tmp[1],occurrence_rate: tmp[0])
      # log.debug("FVW: #{fvw.inspect}")
      #FreqVocWords.create!([{word: tmp[1]}, {occurrence_rate: tmp[0]}, {frequency_vocabulary_id: @frequency_vocabulary.id}])
    end
    respond_to do |format|
      if @frequency_vocabulary.save
        format.html { redirect_to @frequency_vocabulary, notice: 'Frequency vocabulary was successfully created.' }
        format.json { render :show, status: :created, location: @frequency_vocabulary }
      else
        format.html { render :new }
        format.json { render json: @frequency_vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frequency_vocabularies/1
  # PATCH/PUT /frequency_vocabularies/1.json
  def update
    respond_to do |format|
      if @frequency_vocabulary.update(frequency_vocabulary_params)
        format.html { redirect_to @frequency_vocabulary, notice: 'Frequency vocabulary was successfully updated.' }
        format.json { render :show, status: :ok, location: @frequency_vocabulary }
      else
        format.html { render :edit }
        format.json { render json: @frequency_vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frequency_vocabularies/1
  # DELETE /frequency_vocabularies/1.json
  def destroy
    @frequency_vocabulary.destroy
    respond_to do |format|
      format.html { redirect_to frequency_vocabularies_url, notice: 'Frequency vocabulary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frequency_vocabulary
      @frequency_vocabulary = FrequencyVocabulary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frequency_vocabulary_params
      params.require(:frequency_vocabulary).permit(:book_id, :file)
    end
end
