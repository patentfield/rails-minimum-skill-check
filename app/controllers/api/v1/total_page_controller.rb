class Api::V1::TotalPageController < ApplicationController
  def index
    @results = Uspto::SearchService.new(params[:my_params]).run
    render json: @results["numFound"]
  end
end
