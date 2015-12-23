class BooksController < ApplicationController
  responders :flash, :collection

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    respond_with @books
  end

  def show
    respond_with @book
  end

  def new
    @book = Book.new
    respond_with @book
  end

  def edit
    respond_with @book
  end

  def create
    @book = Book.create(book_params)
    respond_with @book
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with @book
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description)
    end
end
