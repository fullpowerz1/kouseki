class Admin::RankingsController < ApplicationController

  def show
    @ranking = Ranking.find(params[:id])
  end

  def update
    @ranking = Ranking.find(params[:id])
    @ranking.update(ranking_params)
    redirect_to admin_ranking_path(@ranking)
  end

  private

  def ranking_params
    params.require(:ranking).permit(:customer_id, :ore, :type, :name, :amount, :rank, :status)
  end
end
