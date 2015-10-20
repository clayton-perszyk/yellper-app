class FoodsController < ApplicationController
  def show
    @search = PgSearch.multisearch 'tacos'
    #  = search.map { |s| s.searchable.title }
  end
end
