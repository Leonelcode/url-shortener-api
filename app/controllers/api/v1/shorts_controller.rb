class Api::V1::ShortsController < ApplicationController
  def create
    @short = Short.new(short_params)
    if @short.save!
      json_response(@short.shortcode, :created)
    end
  end

  private

  def update_stats_redirect_count
    @short.update_from_endpoint
  end

  def short_params
    params.permit(:url, :shortcode)
  end
end