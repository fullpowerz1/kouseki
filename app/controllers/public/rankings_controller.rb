class Public::RankingsController < ApplicationController

  def new
    @ranking = Ranking.new
    @current_customer = current_customer
  end

  def confirm
    @ranking = Ranking.new(ranking_params)
  end

  def complete
  end

  def create
    @ranking = Ranking.new(ranking_params)
    @ranking.save!
    redirect_to rankings_complete_path
  end


  def show
    @ranking = Ranking.find(params[:id])
    @ranking_details = @ranking.ranking_details
  end

  private

  def ranking_params
    params.require(:ranking).permit(:customer_id, :ore, :type, :name, :amount, :rank, :status)
  end
end
