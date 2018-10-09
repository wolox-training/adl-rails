# frozen_string_literal: true

class OpenLibraryService
  def book_info(isbn)
    url = "https://openlibrary.org/api/books?format=json&jscmd=data&bibkeys=ISBN:#{isbn}"
    ol_response = HTTParty.get(url)["ISBN:#{isbn}"]
    hash_response = {}
    hash_response['isbn'] = isbn
    hash_response['title'] = ol_response['title']
    hash_response['subtitle'] = ol_response['subtitle']
    hash_response['number_of_pages'] = ol_response['number_of_pages']
    hash_response['authors'] = ol_response['authors']

    hash_response
  end
end
