# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        render json: OpenLibraryService.new.isbn_hash(params[:id])
      end
    end
  end
end
