class SearchesController < ApplicationController
  def search
    @range = params[:range]
    if @range == "Ore"
      @ore = Ore.looks(params[:search], params[:word])
    else
      @genre =Genre.looks(params[:search], params[:word])
    end
  end
end
