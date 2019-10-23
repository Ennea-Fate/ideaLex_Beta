class ConcWordsController < ApplicationController
  before_action :set_conc_word, only: [:show, :edit, :update, :destroy]

  # GET /conc_words
  # GET /conc_words.json
  def index
    @conc_words = ConcWord.all
  end

  # GET /conc_words/1
  # GET /conc_words/1.json
  def show
  end

  # GET /conc_words/new
  def new
    @conc_word = ConcWord.new
  end

  # GET /conc_words/1/edit
  def edit
  end

  # POST /conc_words
  # POST /conc_words.json
  def create
    @conc_word = ConcWord.new(conc_word_params)

    respond_to do |format|
      if @conc_word.save
        format.html { redirect_to @conc_word, notice: 'Conc word was successfully created.' }
        format.json { render :show, status: :created, location: @conc_word }
      else
        format.html { render :new }
        format.json { render json: @conc_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conc_words/1
  # PATCH/PUT /conc_words/1.json
  def update
    respond_to do |format|
      if @conc_word.update(conc_word_params)
        format.html { redirect_to @conc_word, notice: 'Conc word was successfully updated.' }
        format.json { render :show, status: :ok, location: @conc_word }
      else
        format.html { render :edit }
        format.json { render json: @conc_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conc_words/1
  # DELETE /conc_words/1.json
  def destroy
    @conc_word.destroy
    respond_to do |format|
      format.html { redirect_to conc_words_url, notice: 'Conc word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conc_word
      @conc_word = ConcWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conc_word_params
      params.require(:conc_word).permit(:word, :concordance, :pages, :concordance_id)
    end
end
