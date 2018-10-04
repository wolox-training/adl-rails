# frozen_string_literal: true

module Api
  module V1
    class RentsController < ApiController
      rescue_from Pundit::NotAuthorizedError, with: :pundit_not_authorized_error

      def index
        @rents = Rent.where(user_id: params[:user_id])
        @user = User.find(params[:user_id])
        authorize(@user)
        render_paginated @rents
      end

      def create
        @rent = Rent.new(rent_params)
        @user = User.find(params[:user_id])
        authorize(@user)
        if @rent.save
          EmailWorker.perform_async(@rent.id)
        else
          render json: { errors: @rent.errors.full_messages }, status: :bad_request
        end
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :initial_date, :final_date)
      end

      def pundit_not_authorized_error
        render json: { errors: "You're not authorized to do this action" }, status: :unauthorized
      end
    end
  end
end
