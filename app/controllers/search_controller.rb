class SearchController < ApplicationController

  def index
    @facade = SearchFacade.new(params[:zip])
  end
end
