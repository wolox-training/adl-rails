# frozen_string_literal: true

require 'rails_helper'

describe OpenLibraryService, type: :service do
  describe 'GET #search_book' do
    let!(:service) { OpenLibraryService.new }
    let(:hash) { service.get_book_hash('0385472579') }

    context 'when service connects successfully with external API and book exists' do
      before do
        stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data')
          .to_return(body: File.read(file_fixture('ok.json')), status: 200)
      end

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

    context "when service connects successfully with external API but book doesn't exist" do
      before do
        stub_request(:get, 'https://openlibrary.org/api/books?bibkeys=ISBN:0385472579&format=json&jscmd=data')
          .to_return(body: File.read(file_fixture('fail.json')), status: 404)
      end

      it "raises a 'inexistent book' message " do
        expect(hash).to eq "We couldn't find that book, sorry"
      end
    end

    context "When service fails to connect to external API's URI" do
      before do
        allow(OpenLibraryService).to receive(:get).and_raise(SocketError)
      end

      it 'raises a "URI wrong" message ' do
        expect(hash).to eq 'The URI is wrong, change it please'
      end
    end
  end
end
