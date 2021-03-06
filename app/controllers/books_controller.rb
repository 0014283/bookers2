class BooksController < ApplicationController
	before_action :authenticate_user!

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book.id)
			flash[:notice]="Book was successfully created."
		else
			@books = Book.all
			render :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.new
		@book_show = Book.find(params[:id])
		@user = @book_show.user
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id)
			flash[:notice]="Book was successfully updated."
		else
			@books = Book.all
			render 'edit'
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path(@book.id)
	end

	private
	def book_params
		params.require(:book).permit(:title, :opinion, :user_id)
	end

end
