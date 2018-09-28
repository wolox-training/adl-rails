module Api
  module V1
    class RentsController < ApiController
      def index
        @rents = Rent.where(user_id: params[:user_id])
        render_paginated @rents
      end

      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          EmailWorker.perform_async(@rent.id)
          render json: { response: 'The rent has been created' }, status: :ok
        else
          render json: { errors: @rent.errors.full_messages }, status: :bad_request
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :initial_date, :final_date)
      end
    end
  end
end
