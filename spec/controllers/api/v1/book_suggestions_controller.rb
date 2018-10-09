# frozen_string_literal: true

require 'rails_helper'
require './spec/controllers/api/v1/authenticated_user'

describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST #create' do
    context 'When creating a valid book suggestion with authorized spanish user' do
      let(:user) { create(:user, :lang_es) }
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion) }

      before do
        request.headers.merge! user.create_new_auth_token
        post :create, params: { book_suggestion: book_suggestion_attr }
      end

      it 'creates a new book_suggestion with valid user_id' do
        request_response = JSON.parse(response.body)
        expect(request_response['user_id']).to eq user.id
      end

      it 'responds with created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a valid book suggestion with unauthorized user' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion) }

      before do
        post :create, params: { book_suggestion: book_suggestion_attr }
      end

      it 'creates a new book_suggestion with user_id nil' do
        request_response = JSON.parse(response.body)
        expect(request_response['user_id']).to eq nil
      end

      it 'responds with created status' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
