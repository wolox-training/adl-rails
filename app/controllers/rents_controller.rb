class RentsController < ApplicationController
  include Wor::Paginate
  before_action :authenticate_user!

  def index
    @rents = Rent.all
    render_paginated @rents
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.save
  end 

  private
  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :initial_date, :final_date)
  end

end
