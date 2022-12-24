class Admin::RankingsController < ApplicationController

  def show
    @ranking = Ranking.find(params[:id])
  end

  def update
    @ranking = Ranking.find(params[:id])
    if @ranking.update(ranking_params)
      @ranking.update_all(rank: 2) if @ranking.rank == "rank3"
    end
      redirect_to admin_ranking_path(@ranking)
  end

  private

  def ranking_params
    params.require(:ranking).permit(:customer_id, :ore, :amulet, :name, :amount, :rank, :status)
  end
end
