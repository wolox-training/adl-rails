# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
      skip_before_action :authenticate_user!, only: [:show]

      def show
        respond_to do |format|
          format.html do
            render 'open_library/show.html.erb'
          end
          format.json do
            show_json_response
          end
        end
      end

      private

      def show_json_response
        begin
          json_a_devolver = OpenLibraryService.new.book_hash(params['id'])
        rescue NoMethodError
          render json: { errors: "We couldn't find this book, sorry please" }, status: :not_found
          return
        end
        render json: { resp: json_a_devolver }, status: :ok
      end
    end
  end
end
