class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@book = Book.new
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
		@books = @user.books.all
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
			flash[:notice]="User was successfully updated."
		else
			redirect_to action: 'show'
		end
	end


	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
