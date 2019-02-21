class PedsController < ApplicationController
  def index
    patentWord=Search.all.order(id: :desc)[0]
    if patentWord
      @word=patentWord.word
    else
      @word=""
    end
    result = Peds::Client.search_by(firstNamedApplicant: @word)
    @docs = result[:body][:queryResults][:searchResponse][:response][:docs]
  end

  def search
    @word=Search.new
    @word.word=params[:search]
    @word.save
    redirect_to("/peds")
  end

  def records
    @words=Search.all.order(id: :desc)
  end

  def destroy
    @words=Search.all
    for word in @words
      word.destroy
    end
    redirect_to("/peds/records")
  end
end
