class Short < ApplicationRecord
	validates :url, presence: true
	validates :shortcode, uniqueness: true
	validates :shortcode, format: { with: /\A[0-9a-zA-Z_=-]{6}\z/i }, allow_nil: true
	before_save :url_encode_date
	
  private
  def url_encode_date
    self.start_date = DateTime.now.in_time_zone('UTC').iso8601
  end
end
