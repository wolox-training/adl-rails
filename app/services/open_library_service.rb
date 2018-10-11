# frozen_string_literal: true

class OpenLibraryService
  include HTTParty
  HTTPARTY_BASE_URL = 'https://openlibrary.org'
  base_uri HTTPARTY_BASE_URL

  def isbn_hash(isbn)
    book_information(isbn)
  end

  private

  def book_information(isbn)
    url_isbn = "ISBN:#{isbn}"
    begin
      ol_response = self.class.get('/api/books', build_query_options(url_isbn))[url_isbn]
    rescue SocketError
      return 'The URI is wrong, change it please'
    end

    build_hash(ol_response, isbn)
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

  def build_query_options(url_isbn)
    { query: { bibkeys: url_isbn, format: 'json', jscmd: 'data' } }
  end
end
