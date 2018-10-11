# frozen_string_literal: true

require 'rails_helper'

describe OpenLibraryService, type: :service do
  describe 'GET #book_hash' do
    let!(:service) { OpenLibraryService.new }
    let(:hash) { service.book_hash('0385472579') }

    context 'when service connects successfully with external API' do
      it "its response's title is Zen speaks" do
        expect(hash[:title]).to eq 'Zen speaks'
      end

      it "its response's ISBN 0385472579" do
        expect(hash[:isbn]).to eq '0385472579'
      end

      it "its response's subtitle is 'shouts of nothingness' " do
        expect(hash[:subtitle]).to eq 'shouts of nothingness'
      end

      it "its response's number_of_pages 159" do
        expect(hash[:number_of_pages]).to eq 159
      end
    end

    context "When service fails to connect to external API's URI" do
      before do
        allow(OpenLibraryService).to receive(:get).and_raise(SocketError)
      end

      it 'raises and SocketError exception' do
        response = service.book_hash('0385472579')
        expect(response).to eq 'The URI is wrong, change it please'
      end
    end
  end
end
