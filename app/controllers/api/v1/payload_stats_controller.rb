class Api::V1::PayloadStatsController < ApplicationController
  def top_urls
    render json: @top_urls = Payload.top_urls
  end
end
