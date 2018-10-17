# frozen_string_literal: true

class OpenLibraryService
  include HTTParty
  HTTPARTY_BASE_URL = 'https://openlibrary.org'
  base_uri HTTPARTY_BASE_URL

  def get_book_hash(isbn)
    url_isbn = "ISBN:#{isbn}"
    begin
      ol_response = search_book(url_isbn)
    rescue SocketError
      return 'The URI is wrong, change it please'
    end

    build_hash(ol_response, isbn, url_isbn)
  end

  private

  def search_book(url_isbn)
    JSON.parse(self.class.get('/api/books', query: build_query_options(url_isbn),
                                            headers: build_headers))
  end

  def build_hash(ol_response, isbn, url_isbn)
    {
      isbn: isbn,
      title: ol_response[url_isbn]['title'],
      subtitle: ol_response[url_isbn]['subtitle'],
      number_of_pages: ol_response[url_isbn]['number_of_pages'],
      authors: ol_response[url_isbn]['authors']
    }
  rescue NoMethodError
    "We couldn't find that book, sorry"
  end

  def build_headers
    { 'Accept' => 'application/json' }
  end

  def build_query_options(url_isbn)
    { bibkeys: url_isbn, format: 'json', jscmd: 'data' }
  end
end
