class BooksController < ApplicationController
  before_action :require_signing_in, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @books = Book.all
  end
    
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to learning_url, notice: "Book was successfully created"
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @book.update(book_params)
      redirect_to books_url, notice: "Book was successfully updated"
    else
      render :edit
    end
  end
  
  def destroy
    @book.destroy
    redirect_to books_url, notice: "Book was successfully deleted"
  end
  
  private
  
  def set_book
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:title, :subtitle, :author,
                                 :link, :year, :publisher, :isbn, :pages)
  end
end