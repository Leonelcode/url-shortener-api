FactoryBot.define do
	factory :short do
		title { Faker::Quote.yoda }
		url { Faker::Internet.url }
		shortcode { SecureRandom.urlsafe_base64(4) }
		start_date { DateTime.now.in_time_zone('UTC').iso8601 }
	end
end
  