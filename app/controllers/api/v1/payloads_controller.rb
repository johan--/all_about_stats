class Api::V1::PayloadsController < ApplicationController
  def index
    render json: Payload.all
  end
end
