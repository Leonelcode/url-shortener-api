class ScraperJob < ApplicationJob
  queue_as :default

  def perform(url, id)
    url_title = ScraperService.new(url).get_title
    new_url = Short.find(id)
    new_url.update(title: url_title)
  end
end
