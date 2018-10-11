# frozen_string_literal: true

require 'rails_helper'

describe OpenLibraryService, type: :service do
  describe 'GET #isbn_hash' do
    let!(:service) { OpenLibraryService.new }
    let(:hash) { service.isbn_hash('0385472579') }
    context 'when service connects successfully with external API' do
      it "its response's title is Zen speaks" do
        expect(hash[:title]).to eq 'Zen speaks'
      end
    end

    context "When service fails to connect to external API's URI" do
      it 'raises and SocketError exception' do
        allow(OpenLibraryService).to receive(:get).and_raise(SocketError)
        response = service.isbn_hash('0385472579')
        expect(response).to eq 'The URI is wrong, change it please'
      end
    end
  end
end
