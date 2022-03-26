class UsersController < ApplicationController
  protect_from_forgery
def new
@user = User.new
@book = Book.new
end

def show
  @user = User.find(params[:id])
  @books = @user.books
  @book = Book.new
end

def create
@User = User.new(user_params)
     if @book.save
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :new
    end
      flash[:notice] = "Signed in successfully."
   end
end

def index
@user = User.find(params[:id])
end

def edit
@user = User.find(params[:id])
end

def update
@book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(user.id)
    else
    render :index
    end
      flash[:notice] = "Book was updated successfully."

    private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end

  def destroy
  end