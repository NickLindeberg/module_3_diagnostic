class SearchController < ApplicationController

  def index
    @facade = UserSearchFacade.new(current_user)
  end
end
