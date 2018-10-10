# frozen_string_literal: true

class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'
  def book_info(isbn)
    hash_response = build_hash(isbn)
    hash_response
  end

  private

  def build_hash(isbn)
    url_isbn = "ISBN:#{isbn}"
    @options = { query: { bibkeys: url_isbn, format: 'json', jscmd: 'data' } }
    ol_response = self.class.get('/api/books', @options)[url_isbn]
    hash_response = {}
    hash_response['isbn'] = isbn
    hash_response['title'] = ol_response['title']
    hash_response['subtitle'] = ol_response['subtitle']
    hash_response['number_of_pages'] = ol_response['number_of_pages']
    hash_response['authors'] = ol_response['authors']
    hash_response
  end
end
