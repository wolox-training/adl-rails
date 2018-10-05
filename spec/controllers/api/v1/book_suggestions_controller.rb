# frozen_string_literal: true

require 'rails_helper'
require './spec/controllers/api/v1/authenticated_user'

describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'
  describe 'POST #create' do
    context 'When creating a valid book suggestion with unauthorized user' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion) }
      it 'creates a new book_suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attr }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion_attr }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a valid book suggestion with authorized user' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion, user: user) }
      it 'creates a new book_suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attr }
          expect(book_suggestion_attr[:user].id).to eq user.id
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion_attr, user: user }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a valid book suggestion with synopsis nil' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion, synopsis: nil) }
      it 'creates a new book_suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attr }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion_attr }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a valid book suggestion with price nil' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion, price: nil) }
      it 'creates a new book_suggestion' do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attr }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion_attr }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a invalid book suggestion with year nil' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion, year: nil) }
      it "doesn't create a new book_suggestion" do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attr }
          expect(response).to have_http_status(500)
        end.to change { BookSuggestion.count }.by(0)
      end
    end

    context 'When creating a invalid book suggestion with author nil' do
      let!(:book_suggestion_attr) { attributes_for(:book_suggestion, author: nil) }
      it "doesn't create a new book_suggestion" do
        expect do
          post :create, params: { book_suggestion: book_suggestion_attr }
          expect(response).to have_http_status(500)
        end.to change { BookSuggestion.count }.by(0)
      end
    end
  end
end
