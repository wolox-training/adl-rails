class BooksController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def index
    @books = Book.all
    render_paginated @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end
end