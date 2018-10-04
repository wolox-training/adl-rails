# frozen_string_literal: true

ActiveAdmin.register Rent do
  permit_params :user_id, :book_id, :initial_date, :final_date
end
