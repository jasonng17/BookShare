class BooksController < ApplicationController
  before_action :get_user
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @book = @user.books.recent.all
  end

  def show
  end

  def new
    @book = @user.books.new
  end

  def edit
  end

  def create
    @book = @user.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to [@user, @book], notice: 'Book was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
   respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to [@user,@book], notice: 'Book was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to user_book_path }
    end
  end

  private

    # Every action in this controller will be associated with an individual user
    def get_user
      @user = User.find(params[:user_id])
    end

    def set_book
      @book = @user.books.find(params[:id])
    end

   def book_params
      params.require(:book).permit(:title, :author, :isbn, :publisher, :description, :image_url)
    end
end
