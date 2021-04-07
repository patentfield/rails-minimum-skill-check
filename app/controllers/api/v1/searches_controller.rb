class Api::V1::SearchesController < ApplicationController
  def index
    @shops = Gurumes::SearchService.new(params[:word]).run
  end
end
