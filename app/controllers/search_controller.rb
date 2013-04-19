class SearchController < ApplicationController
  def index
    if params[:query]
      @pg_search_documents = PgSearch.multisearch(params[:query])
    end
  end
end