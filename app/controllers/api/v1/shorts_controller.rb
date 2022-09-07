class Api::V1::ShortsController < ApplicationController
  def create
    @short = Short.new(short_params)
    if @short.save!
      ScraperJob.perform_later(@short.url, @short.id)
      json_response(@short.shortcode, :created)
    end
  end

  def fetch_short
    @short = Short.find_by_shortcode!(params[:shortcode])
    json_response(@short.shortcode, 302, @short.url)
    update_stats_redirect_count
  end

  def stats
    @shorts = Short.top_100
    json_response(@shorts, 302)
  end
  private

  def update_stats_redirect_count
    @short.update_from_endpoint
  end

  def short_params
    params.permit(:url, :shortcode)
  end
end