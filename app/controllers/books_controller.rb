class BooksController < ApplicationController
  protect_from_forgery

  def new
    @book = Book.new
  end

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :index
    end
    flash[:notice] = "You have created book successfully."
  end

 def index
　  @book = Book.new
　  @books = Book.all
 end

 def show
     @book = Book.find(params[:id])
 end

 def edit
     @book = Book.find(params[:id])
 end

 def update
     @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)
    else
      @book = Book.all
      render :edit
    end
     flash[:notice] = "Book was updated successfully."
  end

 def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
 end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end