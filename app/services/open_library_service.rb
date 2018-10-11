# frozen_string_literal: true

class OpenLibraryService
  include HTTParty.freeze
  HTTPARTY_BASE_URL = 'https://openlibrary.org'
  base_uri HTTPARTY_BASE_URL

  def book_hash(isbn)
    url_isbn = "ISBN:#{isbn}"
    begin
      ol_response = self.class.get('/api/books', query: build_query_options(url_isbn),
                                                 headers: build_headers)[url_isbn]
    rescue SocketError
      return 'The URI is wrong, change it please'
    end

    build_hash(ol_response, isbn)
  end

  private

  def build_hash(ol_response, isbn)
    {
      isbn: isbn,
      title: ol_response['title'],
      subtitle: ol_response['subtitle'],
      number_of_pages: ol_response['number_of_pages'],
      authors: ol_response['authors']
    }
  end

  def build_headers
    { 'Accept' => 'application/json' }
  end

  def build_query_options(url_isbn)
    { bibkeys: url_isbn, format: 'json', jscmd: 'data' }
  end
end
