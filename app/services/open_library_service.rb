
class OpenLibraryService

  def book_info()
    ol_response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')
    return ol_response
  end

end
