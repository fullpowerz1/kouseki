class Public::FavoritesController < ApplicationController

  def create
    @ranking = Ranking.find(params[:ranking_id])
    favorite = current_customer.favorites.new(ranking_id: @ranking.id)
    favorite.save
  end

  def destroy
    @ranking = Ranking.find(params[:ranking_id])
    favorite = current_customer.favirutes.find_by(ranking_id: @ranking.id)
    favorite.destroy
  end

end