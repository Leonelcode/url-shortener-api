require 'rails_helper'
require 'support/shared_factories'

RSpec.describe Short, type: :model do
  include_context 'shared factories'

  describe 'shortlink' do
    # checks if url is present
    it { should validate_presence_of(:url)}

    it 'generates valid shortcode' do
      expect(!!(short[:shortcode] =~ /\A[0-9a-zA-Z_]{6}\z/i)).to eq true
    end
  end

  describe 'preferential shortcode' do
    it 'checks for valid pref shortcode' do
      short = Short.new(url: 'http://example.com', shortcode: '123456')
      expect(short.valid_preferential_shortcode?(:shortcode)).to eq true
    end
  end

end
