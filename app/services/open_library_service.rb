# frozen_string_literal: true

class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def isbn_hash(isbn)
    hash_response = book_information(isbn)
    hash_response
  end

  private

  def book_information(isbn)
    url_isbn = "ISBN:#{isbn}"
    @options = { query: { bibkeys: url_isbn, format: 'json', jscmd: 'data' },
                 headers: { 'Accept' => 'application/json' } }
    begin
      ol_response = self.class.get('/api/books', @options)[url_isbn]
    rescue SocketError
      return 'The URI is wrong, change it please'
    end
    hash = build_hash(ol_response, isbn)
    hash
  end

  def build_hash(ol_response, isbn)
    {
      isbn: isbn,
      title: ol_response['title'],
      subtitle: ol_response['subtitle'],
      number_of_pages: ol_response['number_of_pages'],
      authors: ol_response['authors']
    }
  end
end
