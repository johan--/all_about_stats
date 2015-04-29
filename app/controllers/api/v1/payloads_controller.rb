class Api::V1::PayloadsController < ApplicationController
  def index
    render json: Payload.all
  end

  def show
    render json: Payload.find(params[:id])
  end
end
