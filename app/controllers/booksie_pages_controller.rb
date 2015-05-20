class BooksiePagesController < ApplicationController
	before_action :set_booksie_page, only: [:show, :edit, :update, :destroy]

	def index
		@booksie_page = current_user.booksie_pages.all
	end

	def show
	end

	def new
		@booksie_page = current_user.booksie_pages.new
	end

	def edit
	end

	def create
	end


end
