class Api::V1::SearchesController < ApplicationController
  def index
    @results = Usptos::SearchService.new(params[:word]).run
  end
end
