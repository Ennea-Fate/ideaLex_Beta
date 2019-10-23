class SubjIndWordsController < ApplicationController
  before_action :set_subj_ind_word, only: [:show, :edit, :update, :destroy]

  # GET /subj_ind_words
  # GET /subj_ind_words.json
  def index
    @subj_ind_words = SubjIndWord.all
  end

  # GET /subj_ind_words/1
  # GET /subj_ind_words/1.json
  def show
  end

  # GET /subj_ind_words/new
  def new
    @subj_ind_word = SubjIndWord.new
  end

  # GET /subj_ind_words/1/edit
  def edit
  end

  # POST /subj_ind_words
  # POST /subj_ind_words.json
  def create
    @subj_ind_word = SubjIndWord.new(subj_ind_word_params)

    respond_to do |format|
      if @subj_ind_word.save
        format.html { redirect_to @subj_ind_word, notice: 'Subj ind word was successfully created.' }
        format.json { render :show, status: :created, location: @subj_ind_word }
      else
        format.html { render :new }
        format.json { render json: @subj_ind_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subj_ind_words/1
  # PATCH/PUT /subj_ind_words/1.json
  def update
    respond_to do |format|
      if @subj_ind_word.update(subj_ind_word_params)
        format.html { redirect_to @subj_ind_word, notice: 'Subj ind word was successfully updated.' }
        format.json { render :show, status: :ok, location: @subj_ind_word }
      else
        format.html { render :edit }
        format.json { render json: @subj_ind_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subj_ind_words/1
  # DELETE /subj_ind_words/1.json
  def destroy
    @subj_ind_word.destroy
    respond_to do |format|
      format.html { redirect_to subj_ind_words_url, notice: 'Subj ind word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subj_ind_word
      @subj_ind_word = SubjIndWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subj_ind_word_params
      params.require(:subj_ind_word).permit(:word, :pages, :subject_index_id)
    end
end
