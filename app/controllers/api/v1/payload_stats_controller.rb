class Api::V1::PayloadStatsController < ApplicationController
  def top_urls
    render json: @top_urls = PayloadStats.new.top_urls
  end

  def top_referrers
    render json: @top_referrers = PayloadStats.new.top_referrers
  end
end
