require 'rails_helper'
require './spec/controllers/api/v1/authenticated_user'

describe BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'When fetching all the books' do
      let!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with all books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'when fetching one book' do
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the created book json' do
        expect(response.body).to eq BookSerializer.new(book, root: false).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
