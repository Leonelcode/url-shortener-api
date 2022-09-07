class ScraperService
  def initialize(url)
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    p url
  end

  def get_title
    title = @parsed_page.css('title').text
  end
end
