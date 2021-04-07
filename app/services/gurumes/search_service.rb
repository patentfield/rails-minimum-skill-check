module Gurumes
  class SearchService
    def initialize(word)
      @word = word

    end

    def run
      uri = URI.parse("https://ped.uspto.gov/api/queries")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme === "https"
      # word = params[:search]
      a_params = {
        "searchText":"firstNamedApplicant:(#{@word})",
        "fq":["appStatus:\"Patented Case\""],
        "fl":"*",
        "mm":"100%",
        "df":"patentTitle",
        "qf":"appEarlyPubNumber applId appLocation appType appStatus_txt appConfrNumber appCustNumber appGrpArtNumber appCls appSubCls appEntityStatus_txt patentNumber patentTitle primaryInventor firstNamedApplicant appExamName appExamPrefrdName appAttrDockNumber appPCTNumber appIntlPubNumber wipoEarlyPubNumber pctAppType firstInventorFile appClsSubCls rankAndInventorsList",
        "facet":"false",
        "sort":"applId asc",
        "start":"0"
      }
      headers = { "Content-Type" => "application/json" }
      d_response = http.post(uri.path, a_params.to_json, headers)
      @J_data = JSON.parse(d_response.body)
      response = @J_data["queryResults"]["searchResponse"]["response"]["docs"]

      # render json: res_data
    end
  end
end
