# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        render json: OpenLibraryService.new.get_book_hash(params[:id])
      end
    end
  end
end
