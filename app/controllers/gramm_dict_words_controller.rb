class GrammDictWordsController < ApplicationController
  include Pagy::Backend
  
  before_action :set_gramm_dict_word, only: [:show, :edit, :update, :destroy]

  # GET /gramm_dict_words
  # GET /gramm_dict_words.json
  def index
    @pagy, @gramm_dict_words = pagy(GrammDictWord.all)
  end

  # GET /gramm_dict_words/1
  # GET /gramm_dict_words/1.json
  def show
  end

  # GET /gramm_dict_words/new
  def new
    @gramm_dict_word = GrammDictWord.new
  end

  # GET /gramm_dict_words/1/edit
  def edit
  end

  # POST /gramm_dict_words
  # POST /gramm_dict_words.json
  def create
    @gramm_dict_word = GrammDictWord.new(gramm_dict_word_params)

    respond_to do |format|
      if @gramm_dict_word.save
        format.html { redirect_to @gramm_dict_word, notice: 'Gramm dict word was successfully created.' }
        format.json { render :show, status: :created, location: @gramm_dict_word }
      else
        format.html { render :new }
        format.json { render json: @gramm_dict_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gramm_dict_words/1
  # PATCH/PUT /gramm_dict_words/1.json
  def update
    respond_to do |format|
      if @gramm_dict_word.update(gramm_dict_word_params)
        format.html { redirect_to @gramm_dict_word, notice: 'Gramm dict word was successfully updated.' }
        format.json { render :show, status: :ok, location: @gramm_dict_word }
      else
        format.html { render :edit }
        format.json { render json: @gramm_dict_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gramm_dict_words/1
  # DELETE /gramm_dict_words/1.json
  def destroy
    @gramm_dict_word.destroy
    respond_to do |format|
      format.html { redirect_to gramm_dict_words_url, notice: 'Gramm dict word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gramm_dict_word
      @gramm_dict_word = GrammDictWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gramm_dict_word_params
      params.require(:gramm_dict_word).permit(:word, :chars, :grammar_dictionary_id)
    end
end
