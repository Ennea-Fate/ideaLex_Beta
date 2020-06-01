class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  # include Pagy::Backend

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    length = @book.text.length
    divider = 120;
    str = @book.text
    tmp_pages = str.scan(/.{1,#{divider}}/m)
    @pagy, @pages = pagy_array(tmp_pages)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.text = params[:book][:book_file].tempfile.read
    if book_params[:name].empty?
      @book.name = params[:book][:book_file].original_filename.split(".")[0]
    end
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # def import
  #   begin
  #     Book.import(params[:books, :import_file])
  #     flash[:success] = "<strong>Book Imported!</strong>"
  #     redirect_to books_path
  #   rescue => exception
  #     flash[:error] = "There was a problem importing that contacts file.<br>
  #     <strong>#{exception.message}</strong><br>"
  #     redirect_to import_book_path
  #   end
  # end


  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:text, :name, :publ_date, :book_file)
    end
end
