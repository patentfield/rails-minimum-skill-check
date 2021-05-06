module Uspto
  class SearchService
    def initialize(my_params)
      @word = my_params[0]
      @page = my_params[1]
      @offset = (@page.to_i - 1) * 25

    end

    def run
      uri = URI.parse("https://ped.uspto.gov/api/queries")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme === "https"
      a_params = {
        "searchText":"firstNamedApplicant:(#{@word})",
        "fq":["appStatus:\"Patented Case\""],
        "fl":"*",
        "mm":"100%",
        "df":"patentTitle",
        "qf":"appEarlyPubNumber applId appLocation appType appStatus_txt appConfrNumber appCustNumber appGrpArtNumber appCls appSubCls appEntityStatus_txt patentNumber patentTitle primaryInventor firstNamedApplicant appExamName appExamPrefrdName appAttrDockNumber appPCTNumber appIntlPubNumber wipoEarlyPubNumber pctAppType firstInventorFile appClsSubCls rankAndInventorsList",
        "facet":"false",
        "sort":"applId asc",
        "start":"#{@offset}"
      }
      headers = { "Content-Type" => "application/json" }
      d_response = http.post(uri.path, a_params.to_json, headers)
      @J_data = JSON.parse(d_response.body)
      # response = @J_data["queryResults"]["searchResponse"]["response"]["docs"]
      response = @J_data["queryResults"]["searchResponse"]["response"]

    end
  end
end
