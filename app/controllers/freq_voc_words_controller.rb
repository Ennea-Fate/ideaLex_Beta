class FreqVocWordsController < ApplicationController
  include Pagy::Backend

  before_action :set_freq_voc_word, only: [:show, :edit, :update, :destroy]

  # GET /freq_voc_words
  # GET /freq_voc_words.json
  def index
    @pagy, @freq_voc_words = pagy(FreqVocWord.all)
  end

  # GET /freq_voc_words/1
  # GET /freq_voc_words/1.json
  def show
  end

  # GET /freq_voc_words/new
  def new
    @freq_voc_word = FreqVocWord.new
  end

  # GET /freq_voc_words/1/edit
  def edit
  end

  # POST /freq_voc_words
  # POST /freq_voc_words.json
  def create
    @freq_voc_word = FreqVocWord.new(freq_voc_word_params)

    respond_to do |format|
      if @freq_voc_word.save
        format.html { redirect_to @freq_voc_word, notice: 'Freq voc word was successfully created.' }
        format.json { render :show, status: :created, location: @freq_voc_word }
      else
        format.html { render :new }
        format.json { render json: @freq_voc_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /freq_voc_words/1
  # PATCH/PUT /freq_voc_words/1.json
  def update
    respond_to do |format|
      if @freq_voc_word.update(freq_voc_word_params)
        format.html { redirect_to @freq_voc_word, notice: 'Freq voc word was successfully updated.' }
        format.json { render :show, status: :ok, location: @freq_voc_word }
      else
        format.html { render :edit }
        format.json { render json: @freq_voc_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /freq_voc_words/1
  # DELETE /freq_voc_words/1.json
  def destroy
    @freq_voc_word.destroy
    respond_to do |format|
      format.html { redirect_to freq_voc_words_url, notice: 'Freq voc word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freq_voc_word
      @freq_voc_word = FreqVocWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def freq_voc_word_params
      params.require(:freq_voc_word).permit(:word, :occurrence_rate, :frequency_vocabulary_id)
    end
end
