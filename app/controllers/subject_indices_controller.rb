class SubjectIndicesController < ApplicationController
  before_action :set_subject_index, only: [:show, :edit, :update, :destroy]

  # GET /subject_indices
  # GET /subject_indices.json
  def index
    @subject_indices = SubjectIndex.all
  end

  # GET /subject_indices/1
  # GET /subject_indices/1.json
  def show
  end

  # GET /subject_indices/new
  def new
    @subject_index = SubjectIndex.new
  end

  # GET /subject_indices/1/edit
  def edit
  end

  # POST /subject_indices
  # POST /subject_indices.json
  def create
    @subject_index = SubjectIndex.new(subject_index_params)

    respond_to do |format|
      if @subject_index.save
        format.html { redirect_to @subject_index, notice: 'Subject index was successfully created.' }
        format.json { render :show, status: :created, location: @subject_index }
      else
        format.html { render :new }
        format.json { render json: @subject_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_indices/1
  # PATCH/PUT /subject_indices/1.json
  def update
    respond_to do |format|
      if @subject_index.update(subject_index_params)
        format.html { redirect_to @subject_index, notice: 'Subject index was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_index }
      else
        format.html { render :edit }
        format.json { render json: @subject_index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_indices/1
  # DELETE /subject_indices/1.json
  def destroy
    @subject_index.destroy
    respond_to do |format|
      format.html { redirect_to subject_indices_url, notice: 'Subject index was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_index
      @subject_index = SubjectIndex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_index_params
      params.require(:subject_index).permit(:book_id)
    end
end
