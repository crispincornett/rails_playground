module Culture
  class BooksController < AuthenticatedController
    responders :flash, :collection

    before_action :set_book, only: [:show, :edit, :update, :destroy]

    def index
      @books = current_user.books.order(:title)

      respond_to do |format|
        format.pdf do
          render pdf: 'books.pdf',
            disposition: 'inline',
            template: 'culture/books/index.pdf.erb',
            layout: 'pdf_layout.html',
            footer: {
              html: {
                template: 'shared/footer'
              }
            }
        end
      end
    end

    def show
      # respond_with @book
      respond_to do |format|
        format.html
        format.json
        format.pdf do
          render pdf: 'book.pdf',
            disposition: 'inline',
            template: 'culture/books/show.pdf.erb',
            layout: 'pdf_layout.html'
        end
      end
    end

    def new
      @book = current_user.books.new()
      respond_with @book
    end

    def create
      @book = current_user.books.create(book_params)
      respond_with @book
    end

    def edit
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
        @book = current_user.books.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def book_params
        params.require(:culture_book).permit(:title, :description)
      end

  end
end
