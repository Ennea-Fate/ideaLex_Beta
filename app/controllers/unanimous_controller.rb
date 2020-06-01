class UnanimousController < ApplicationController
  before_action :set_unanimou, only: [:show, :edit, :update, :destroy]

  # GET /unanimous
  # GET /unanimous.json
  def index
    @unanimous = Unanimou.all
  end

  # GET /unanimous/1
  # GET /unanimous/1.json
  def show
  end

  # GET /unanimous/new
  def new
    @unanimou = Unanimou.new
  end

  # GET /unanimous/1/edit
  def edit
  end

  # POST /unanimous
  # POST /unanimous.json
  def create
    @unanimou = Unanimou.new(unanimou_params)

    respond_to do |format|
      if @unanimou.save
        format.html { redirect_to @unanimou, notice: 'Unanimou was successfully created.' }
        format.json { render :show, status: :created, location: @unanimou }
      else
        format.html { render :new }
        format.json { render json: @unanimou.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unanimous/1
  # PATCH/PUT /unanimous/1.json
  def update
    respond_to do |format|
      if @unanimou.update(unanimou_params)
        format.html { redirect_to @unanimou, notice: 'Unanimou was successfully updated.' }
        format.json { render :show, status: :ok, location: @unanimou }
      else
        format.html { render :edit }
        format.json { render json: @unanimou.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unanimous/1
  # DELETE /unanimous/1.json
  def destroy
    @unanimou.destroy
    respond_to do |format|
      format.html { redirect_to unanimous_url, notice: 'Unanimou was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unanimou
      @unanimou = Unanimou.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unanimou_params
      params.require(:unanimou).permit(:word, :pos, :chars, :desc, :approves, :author_id, :user_id)
    end
end
