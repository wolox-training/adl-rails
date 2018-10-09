# frozen_string_literal: true

class OpenLibraryService

  #Qué problema tenés?
    #No sabés como llamar lo que seteás en el método base_uri
    #No sabés como llamar a la clase HTTParty desde byebug

  include HTTParty
  base_uri "https://openlibrary.org"

  def book_info(isbn)
    hash_response = build_hash(isbn)
    return hash_response
  end

  private

  def build_hash(isbn)
    url_isbn = "ISBN:#{isbn}"
    @options = { query: { bibkeys: url_isbn, format: "json", jscmd: "data" } }
    ol_response = self.class.get("/api/books", @options)
    ol_response = ol_response[url_isbn]
    hash_response = {}
    hash_response['isbn'] = isbn
    hash_response['title'] = ol_response['title']
    hash_response['subtitle'] = ol_response['subtitle']
    hash_response['number_of_pages'] = ol_response['number_of_pages']
    hash_response['authors'] = ol_response['authors']
    return hash_response
  end
end
