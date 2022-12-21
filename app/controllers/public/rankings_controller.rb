class Public::RankingsController < ApplicationController

  def new
    @ranking = Ranking.new
    @current_customer = current_customer
  end




  def show
    @ranking = Ranking.find(params[:id])
    @ranking_details = @ranking.ranking_details
  end

end
