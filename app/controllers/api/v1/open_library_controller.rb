# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
        skip_before_action :authenticate_user!, only: [:show] #OJOOO

      def show
        respond_to do |format|
          format.html {render "open_library/show.html.erb"}
          format.json {render json: OpenLibraryService.new.book_hash(params[:isbn]) }
        end

        # if peticion.ajax? == false
            # devolver vista
        # else
            # devolver codigo de estado dependiendo de si el servicio encontró o no el libro
        # end

      end
    end
  end
end
