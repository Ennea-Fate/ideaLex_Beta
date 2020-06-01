class GrammDictWordFormsController < ApplicationController
  include Pagy::Backend

  before_action :set_gramm_dict_word_form, only: [:show, :edit, :update, :destroy]

  # GET /gramm_dict_word_forms
  # GET /gramm_dict_word_forms.json
  def index
    @pagy, @gramm_dict_word_forms = pagy(GrammDictWordForm.all)
  end

  # GET /gramm_dict_word_forms/1
  # GET /gramm_dict_word_forms/1.json
  def show
  end

  # GET /gramm_dict_word_forms/new
  def new
    @gramm_dict_word_form = GrammDictWordForm.new
  end

  # GET /gramm_dict_word_forms/1/edit
  def edit
  end

  # POST /gramm_dict_word_forms
  # POST /gramm_dict_word_forms.json
  def create
    log = Logger.new('log/my.log')
    @gramm_dict_word_form = GrammDictWordForm.new(gramm_dict_word_form_params)
    #log.debug("[In GDWF controller] gramm_dict_word_form = #{@gramm_dict_word_form.inspect}")
    respond_to do |format|
      if @gramm_dict_word_form.save
        format.html { redirect_to @gramm_dict_word_form, notice: 'Gramm dict word form was successfully created.' }
        format.json { render :show, status: :created, location: @gramm_dict_word_form }
      else
        format.html { render :new }
        format.json { render json: @gramm_dict_word_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gramm_dict_word_forms/1
  # PATCH/PUT /gramm_dict_word_forms/1.json
  def update
    respond_to do |format|
      if @gramm_dict_word_form.update(gramm_dict_word_form_params)
        format.html { redirect_to @gramm_dict_word_form, notice: 'Gramm dict word form was successfully updated.' }
        format.json { render :show, status: :ok, location: @gramm_dict_word_form }
      else
        format.html { render :edit }
        format.json { render json: @gramm_dict_word_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gramm_dict_word_forms/1
  # DELETE /gramm_dict_word_forms/1.json
  def destroy
    @gramm_dict_word_form.destroy
    respond_to do |format|
      format.html { redirect_to gramm_dict_word_forms_url, notice: 'Gramm dict word form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gramm_dict_word_form
      @gramm_dict_word_form = GrammDictWordForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gramm_dict_word_form_params
      params.require(:gramm_dict_word_form).permit(:word, :chars, :entries, :gramm_dict_words_id)
    end
end
