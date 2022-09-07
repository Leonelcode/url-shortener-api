class Short < ApplicationRecord
	validates :url, presence: true
	validates :shortcode, uniqueness: true
	validates :shortcode, format: { with: /\A[0-9a-zA-Z_=-]{6}\z/i }, allow_nil: true
  scope :top_100, -> { order(visit_count: :desc).limit(100) }
  before_create { generate_shortcode(:shortcode) }
	before_save :url_encode_date

  def update_from_endpoint
    self.visit_count += 1
    self.last_seen_date = DateTime.now.in_time_zone('UTC').iso8601
    self.save!
  end
  
  def generate_shortcode(shortcode)
    return if valid_preferential_shortcode?(shortcode)
    loop do
      self[shortcode] = SecureRandom.urlsafe_base64(4)
      break unless shortcode_exists?(shortcode)
    end
  end

  def valid_preferential_shortcode?(shortcode)
    !!(self[shortcode] =~ /\A[0-9a-zA-Z_]{6}\z/i) && !shortcode_exists?(shortcode)
  end

  def shortcode_exists?(shortcode)
    Short.exists?(shortcode: self[shortcode])
  end

  private
  def url_encode_date
    self.start_date = DateTime.now.in_time_zone('UTC').iso8601
  end
end
