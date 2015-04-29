class Api::V1::PayloadsController < ApplicationController
  def index
    render json: Payload.all
  end

  def show
    render json: Payload.find(params[:id])
  end

  def create
   render json: Payload.create(payload_params)
  end

  def update
   render json: Payload.update(params[:id], payload_params)
  end


 private

  def payload_params
    params.require(:payload).permit(:url, :referrer)
  end
end
