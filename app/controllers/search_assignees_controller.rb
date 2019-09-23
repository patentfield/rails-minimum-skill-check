class SearchAssigneesController < ApplicationController
    protect_from_forgery except: :search

    def index
    end

    def search(value: params[:form_words])
      uri = URI.parse("http://www.patentsview.org/api/assignees/query?q={%22assignee_first_name%22:%22#{params[:form_words]}%22}")
      json = Net::HTTP.get(uri)
      @results = JSON.parse(json)
    end
end
