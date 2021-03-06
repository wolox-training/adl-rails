# frozen_string_literal: true

module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      before_action :authenticate_user!

      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :null_session
      before_action :configure_permitted_parameters, if: :devise_controller?

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
      end
    end
  end
end
