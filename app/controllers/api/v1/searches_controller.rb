class Api::V1::SearchesController < ApplicationController
  def index
    @results = Uspto::SearchService.new(params[:word]).run
    render json: @results
  end
end
