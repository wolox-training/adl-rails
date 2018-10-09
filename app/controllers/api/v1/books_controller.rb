# frozen_string_literal: true
#require_relative '../../../services/open_library_service'

module Api
  module V1
    class BooksController < ApiController
      def index
        @books = Book.all
        render_paginated @books
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end

      def open_library_show
        byebug
        #ol_response = OpenLibraryService.new.book_info(params[:isbn])
        ol_response = OpenLibraryService.new.book_info("0385472579")
        render json: ol_response
      end
    end
  end
end
