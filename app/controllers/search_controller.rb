class SearchController < ApplicationController
  def index
    if params[:query]
      @pg_search_documents = PgSearch.multisearch(params[:query])
      
      #go straight to result if only 1 is found
      if @pg_search_documents.count == 1
        @result = @pg_search_documents[0]
        redirect_to('/' + @result.searchable.class.to_s.downcase!.pluralize + '/' + @result.searchable.slug)
      end
    end
  end
end