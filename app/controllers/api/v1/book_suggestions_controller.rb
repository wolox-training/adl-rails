module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_user!, only: [:create]

      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_params.merge(user_id: current_user&.id))
        if @book_suggestion.save; render json: @book_suggestion, status: 201 else render json: {errors: @book_suggestion.errors.full_messages}  end
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion).permit(:user_id, :title, :price, :publisher, :author, :year, :link, :synopsis)
      end

    end
  end
end
