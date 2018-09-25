class RentsController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def index
    @rents = Rent.where(user_id: params[:user_id])
    render_paginated @rents
  end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
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
