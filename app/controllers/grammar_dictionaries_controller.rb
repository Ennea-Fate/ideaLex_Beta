class GrammarDictionariesController < ApplicationController
  before_action :set_grammar_dictionary, only: [:show, :edit, :update, :destroy]

  # GET /grammar_dictionaries
  # GET /grammar_dictionaries.json
  def index
    @pagy, @freq_voc_words = pagy(GrammarDictionary.all) 
  end

  # GET /grammar_dictionaries/1
  # GET /grammar_dictionaries/1.json
  def show
    @pagy, @gdw = pagy(GrammDictWord.all)
  end

  # GET /grammar_dictionaries/new
  def new
    @grammar_dictionary = GrammarDictionary.new
  end

  # GET /grammar_dictionaries/1/edit
  def edit
  end

  # POST /grammar_dictionaries
  # POST /grammar_dictionaries.json
  def create
    log = Logger.new('log/my.log')
    @grammar_dictionary = GrammarDictionary.new(grammar_dictionary_params)
    tmp = params[:grammar_dictionary][:file].tempfile.read.force_encoding('windows-1251').encode('utf-8')
    #log.debug("tmp at now is #{tmp.class} and it store:\n#{tmp.truncate(1000)}")
    tmp = tmp.split(/[0-9]+\./).reject! {|c| c.strip.empty?}
    #log.debug("Tmp:\n#{tmp[0]}")
    tmp.each_with_index do |line, num|
      tmp2 = line.split("\n")
      tmp3 = tmp2.shift.split(/[^\p{Cyrillic}+\w\d\.\,\s]+/).reject! {|c| c.strip.empty?}
      #log.debug("Tmp3[#{num}]: #{tmp3}")
      tmp_word = tmp3.shift
      if(tmp3.count == 3)
        tmp_chars = tmp3.shift
      else
        tmp_chars = "-"
      end
      tmp_entries = tmp3.shift
      tmp_sum_entries = tmp3.shift
      #log.debug("tmp_word: #{tmp_word}, tmp_chars: #{tmp_chars}, tmp_entries: #{tmp_entries}, tmp_sum_entries: #{tmp_sum_entries}")
      @gdw = @grammar_dictionary.gramm_dict_words.build(word: tmp_word, chars: tmp_chars, entries: tmp_entries, sum_entries: tmp_sum_entries)
      log.debug("gdw before gdw.save! => #{@gdw.inspect}")
      log.debug("gdw before gdw.save! is valid? => #{@gdw.valid?}")
      @gdw.save!
      #gdw_searching = GrammDictWord.where(word: tmp_word).take
      log.debug("gdw searching resul => #{@gdw.inspect}")
      log.debug("gdw is valid? => #{@gdw.valid?}")
      tmp2.each do |newline|
        #log.debug("Newline: #{newline}")
        tmp4 = newline.split(/[^\p{Cyrillic}+\w\d\.\,\s]+/).reject! {|c| c.strip.empty?}
        #log.debug("tmp4: #{tmp4}")
        tmp_word = tmp4.shift
        if(tmp4.count == 2)
          tmp_chars = tmp4.shift
        else
          tmp_chars = "-"
        end
        tmp_entries = tmp4.shift
        @gdwf = @gdw.gramm_dict_word_forms.build(word: tmp_word, chars: tmp_chars, entries: tmp_entries)
        log.debug("gdwf => #{@gdwf.inspect}")
        @gdwf.save!
        #gdwf.save!
        #log.debug("GDWF inspect: #{gdwf.inspect}")
      end
    end

    respond_to do |format|
      if @grammar_dictionary.save
        format.html { redirect_to @grammar_dictionary, notice: 'Grammar dictionary was successfully created.' }
        format.json { render :show, status: :created, location: @grammar_dictionary }
      else
        #@grammar_dictionary.errors.each{|attr, msg| log.debug("#{attr} - #{msg}\n")}
        format.html { render :new }
        format.json { render json: @grammar_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grammar_dictionaries/1
  # PATCH/PUT /grammar_dictionaries/1.json
  def update
    respond_to do |format|
      if @grammar_dictionary.update(grammar_dictionary_params)
        format.html { redirect_to @grammar_dictionary, notice: 'Grammar dictionary was successfully updated.' }
        format.json { render :show, status: :ok, location: @grammar_dictionary }
      else
        format.html { render :edit }
        format.json { render json: @grammar_dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grammar_dictionaries/1
  # DELETE /grammar_dictionaries/1.json
  def destroy
    @grammar_dictionary.destroy
    respond_to do |format|
      format.html { redirect_to grammar_dictionaries_url, notice: 'Grammar dictionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grammar_dictionary
      @grammar_dictionary = GrammarDictionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grammar_dictionary_params
      params.require(:grammar_dictionary).permit(:book_id, :file)
    end
end
