# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :genre, :title, :publisher, :year, :image, :author
end
